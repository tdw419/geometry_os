; DESCRIPTION: Composite: Sets a single green pixel at (45, 181) then Renders a red line between points (144, 225) and (193, 52) then Places a white 84x20 rectangle at position (60, 178).
; PLAN: r0=45(x), r1=181(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=144(x1), r6=225(y1), r7=193(x2), r8=52(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=60(x), r11=178(y), r12=84(width), r13=20(height), r14=0xFFFFFF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 45
LDI r1, 181
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 144
LDI r6, 225
LDI r7, 193
LDI r8, 52
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 60
LDI r11, 178
LDI r12, 84
LDI r13, 20
LDI r14, 0xFFFFFF
RECTF r10, r11, r12, r13, r14
HALT
