; DESCRIPTION: Composite: Places a orange line segment connecting (458, 86) to (382, 206) then Places a magenta dot at position (309, 126).
; PLAN: r0=458(x1), r1=86(y1), r2=382(x2), r3=206(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=309(x), r6=126(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 458
LDI r1, 86
LDI r2, 382
LDI r3, 206
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 309
LDI r6, 126
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
