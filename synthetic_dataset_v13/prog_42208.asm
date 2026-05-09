; DESCRIPTION: Composite: Places a magenta line segment connecting (264, 183) to (73, 252) then Places a magenta dot at position (255, 244).
; PLAN: r0=264(x1), r1=183(y1), r2=73(x2), r3=252(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=255(x), r6=244(y), r7=0xFF00FF(color). Op: PSET r5, r6, r7.
LDI r0, 264
LDI r1, 183
LDI r2, 73
LDI r3, 252
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 255
LDI r6, 244
LDI r7, 0xFF00FF
PSET r5, r6, r7
HALT
