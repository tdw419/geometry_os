; DESCRIPTION: Composite: Renders a magenta box of size 83x106 starting at (341, 60) then Renders a magenta line between points (393, 207) and (425, 175).
; PLAN: r0=341(x), r1=60(y), r2=83(width), r3=106(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=393(x1), r6=207(y1), r7=425(x2), r8=175(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 341
LDI r1, 60
LDI r2, 83
LDI r3, 106
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 393
LDI r6, 207
LDI r7, 425
LDI r8, 175
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
