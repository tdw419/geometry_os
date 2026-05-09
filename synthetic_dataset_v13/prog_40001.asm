; DESCRIPTION: Composite: Places a purple 78x24 rectangle at position (171, 193) then Renders a black line between points (154, 160) and (252, 83) then Sets a single magenta pixel at (397, 222).
; PLAN: r0=171(x), r1=193(y), r2=78(width), r3=24(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=154(x1), r6=160(y1), r7=252(x2), r8=83(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=397(x), r11=222(y), r12=0xFF00FF(color). Op: PSET r10, r11, r12.
LDI r0, 171
LDI r1, 193
LDI r2, 78
LDI r3, 24
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 154
LDI r6, 160
LDI r7, 252
LDI r8, 83
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
LDI r10, 397
LDI r11, 222
LDI r12, 0xFF00FF
PSET r10, r11, r12
HALT
