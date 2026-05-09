; DESCRIPTION: Composite: Places a cyan line segment connecting (72, 203) to (498, 66) then Places a green dot at position (367, 84).
; PLAN: r0=72(x1), r1=203(y1), r2=498(x2), r3=66(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=367(x), r6=84(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 72
LDI r1, 203
LDI r2, 498
LDI r3, 66
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 367
LDI r6, 84
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
