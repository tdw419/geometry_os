; DESCRIPTION: Composite: Draws a magenta line from (29, 253) to (66, 227) then Creates a magenta rectangular region at (409, 139) spanning 28 by 115 pixels.
; PLAN: r0=29(x1), r1=253(y1), r2=66(x2), r3=227(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=409(x), r6=139(y), r7=28(width), r8=115(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 29
LDI r1, 253
LDI r2, 66
LDI r3, 227
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 409
LDI r6, 139
LDI r7, 28
LDI r8, 115
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
