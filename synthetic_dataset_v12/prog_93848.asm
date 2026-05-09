; DESCRIPTION: Composite: Renders a yellow box of size 52x28 starting at (256, 133) then Places a purple dot at position (461, 252) then Places a red circle of radius 80 at center (221, 103).
; PLAN: r0=256(x), r1=133(y), r2=52(width), r3=28(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=461(x), r6=252(y), r7=0xAA00FF(color). Op: PSET r5, r6, r7 Next: r10=221(x), r11=103(y), r12=80(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 256
LDI r1, 133
LDI r2, 52
LDI r3, 28
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 461
LDI r6, 252
LDI r7, 0xAA00FF
PSET r5, r6, r7
LDI r10, 221
LDI r11, 103
LDI r12, 80
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
