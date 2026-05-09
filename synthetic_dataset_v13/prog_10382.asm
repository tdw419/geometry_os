; DESCRIPTION: Composite: Renders a magenta box of size 111x49 starting at (66, 156) then Places a red line segment connecting (125, 25) to (223, 31).
; PLAN: r0=66(x), r1=156(y), r2=111(width), r3=49(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=125(x1), r6=25(y1), r7=223(x2), r8=31(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 66
LDI r1, 156
LDI r2, 111
LDI r3, 49
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 125
LDI r6, 25
LDI r7, 223
LDI r8, 31
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
