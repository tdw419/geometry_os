; DESCRIPTION: Composite: Places a red circle of radius 30 at center (308, 146) then Places a cyan 100x87 rectangle at position (385, 84) then Renders a purple line between points (226, 184) and (154, 164).
; PLAN: r0=308(x), r1=146(y), r2=30(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=385(x), r6=84(y), r7=100(width), r8=87(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=226(x1), r11=184(y1), r12=154(x2), r13=164(y2), r14=0xAA00FF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 146
LDI r2, 30
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 385
LDI r6, 84
LDI r7, 100
LDI r8, 87
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 226
LDI r11, 184
LDI r12, 154
LDI r13, 164
LDI r14, 0xAA00FF
LINE r10, r11, r12, r13, r14
HALT
