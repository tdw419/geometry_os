; DESCRIPTION: Composite: Places a black line segment connecting (420, 27) to (326, 82) then Places a green dot at position (426, 23).
; PLAN: r0=420(x1), r1=27(y1), r2=326(x2), r3=82(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=426(x), r6=23(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 420
LDI r1, 27
LDI r2, 326
LDI r3, 82
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 426
LDI r6, 23
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
