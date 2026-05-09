; DESCRIPTION: Composite: Places a red dot at position (146, 144) then Places a purple 78x21 rectangle at position (251, 82) then Renders a blue line between points (219, 190) and (495, 220).
; PLAN: r0=146(x), r1=144(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=251(x), r6=82(y), r7=78(width), r8=21(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=219(x1), r11=190(y1), r12=495(x2), r13=220(y2), r14=0x0000FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 146
LDI r1, 144
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 251
LDI r6, 82
LDI r7, 78
LDI r8, 21
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 219
LDI r11, 190
LDI r12, 495
LDI r13, 220
LDI r14, 0x0000FF
LINE r10, r11, r12, r13, r14
HALT
