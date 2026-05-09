; DESCRIPTION: Composite: Places a purple dot at position (484, 92) then Renders a purple box of size 50x13 starting at (73, 161) then Places a green circle of radius 25 at center (371, 133).
; PLAN: r0=484(x), r1=92(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=73(x), r6=161(y), r7=50(width), r8=13(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=371(x), r11=133(y), r12=25(radius), r13=0x00FF00(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 484
LDI r1, 92
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 73
LDI r6, 161
LDI r7, 50
LDI r8, 13
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 371
LDI r11, 133
LDI r12, 25
LDI r13, 0x00FF00
CIRCLE r10, r11, r12, r13
HALT
