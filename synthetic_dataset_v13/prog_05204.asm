; DESCRIPTION: Composite: Places a yellow line segment connecting (226, 23) to (421, 20) then Places a magenta dot at position (326, 214).
; PLAN: r0=226(x1), r1=23(y1), r2=421(x2), r3=20(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=326(x), r6=214(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 226
LDI r1, 23
LDI r2, 421
LDI r3, 20
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 326
LDI r6, 214
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
