; DESCRIPTION: Composite: Places a green line segment connecting (47, 172) to (174, 84) then Places a yellow dot at position (184, 117).
; PLAN: r0=47(x1), r1=172(y1), r2=174(x2), r3=84(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=184(x), r6=117(y), r7=0xFFFF00(color). Op: PSET r5, r6, r7.
LDI r0, 47
LDI r1, 172
LDI r2, 174
LDI r3, 84
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 117
LDI r7, 0xFFFF00
PSET r5, r6, r7
HALT
