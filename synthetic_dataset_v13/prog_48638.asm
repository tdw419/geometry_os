; DESCRIPTION: Composite: Places a green circle of radius 43 at center (366, 125) then Renders a magenta line between points (29, 170) and (103, 223).
; PLAN: r0=366(x), r1=125(y), r2=43(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=29(x1), r6=170(y1), r7=103(x2), r8=223(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 366
LDI r1, 125
LDI r2, 43
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 29
LDI r6, 170
LDI r7, 103
LDI r8, 223
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
