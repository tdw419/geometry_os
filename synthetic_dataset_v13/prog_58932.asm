; DESCRIPTION: Composite: Places a blue line segment connecting (219, 192) to (461, 42) then Places a cyan circle of radius 27 at center (307, 149).
; PLAN: r0=219(x1), r1=192(y1), r2=461(x2), r3=42(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=307(x), r6=149(y), r7=27(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 219
LDI r1, 192
LDI r2, 461
LDI r3, 42
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 307
LDI r6, 149
LDI r7, 27
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
