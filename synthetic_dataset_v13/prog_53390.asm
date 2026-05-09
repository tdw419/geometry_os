; DESCRIPTION: Composite: Places a purple circle of radius 23 at center (308, 51) then Renders a red line between points (35, 242) and (226, 93) then Places a purple 93x48 rectangle at position (42, 9).
; PLAN: r0=308(x), r1=51(y), r2=23(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x1), r6=242(y1), r7=226(x2), r8=93(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=42(x), r11=9(y), r12=93(width), r13=48(height), r14=0xAA00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 308
LDI r1, 51
LDI r2, 23
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 242
LDI r7, 226
LDI r8, 93
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 42
LDI r11, 9
LDI r12, 93
LDI r13, 48
LDI r14, 0xAA00FF
RECTF r10, r11, r12, r13, r14
HALT
