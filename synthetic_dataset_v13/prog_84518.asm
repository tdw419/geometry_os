; DESCRIPTION: Composite: Places a black circle of radius 80 at center (431, 85) then Renders a red box of size 25x13 starting at (161, 63).
; PLAN: r0=431(x), r1=85(y), r2=80(radius), r3=0x000000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=161(x), r6=63(y), r7=25(width), r8=13(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 431
LDI r1, 85
LDI r2, 80
LDI r3, 0x000000
CIRCLE r0, r1, r2, r3
LDI r5, 161
LDI r6, 63
LDI r7, 25
LDI r8, 13
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
