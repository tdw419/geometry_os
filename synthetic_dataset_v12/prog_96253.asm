; DESCRIPTION: Composite: Renders a magenta line between points (406, 68) and (167, 159) then Places a magenta circle of radius 26 at center (311, 152).
; PLAN: r0=406(x1), r1=68(y1), r2=167(x2), r3=159(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=311(x), r6=152(y), r7=26(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 406
LDI r1, 68
LDI r2, 167
LDI r3, 159
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 311
LDI r6, 152
LDI r7, 26
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
HALT
