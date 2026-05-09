; DESCRIPTION: Composite: Places a magenta line segment connecting (421, 159) to (255, 19) then Places a green dot at position (51, 99).
; PLAN: r0=421(x1), r1=159(y1), r2=255(x2), r3=19(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=51(x), r6=99(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 421
LDI r1, 159
LDI r2, 255
LDI r3, 19
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 51
LDI r6, 99
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
