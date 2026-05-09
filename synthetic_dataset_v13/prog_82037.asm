; DESCRIPTION: Composite: Places a magenta line segment connecting (106, 129) to (260, 142) then Places a white circle of radius 53 at center (179, 68).
; PLAN: r0=106(x1), r1=129(y1), r2=260(x2), r3=142(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=179(x), r6=68(y), r7=53(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 106
LDI r1, 129
LDI r2, 260
LDI r3, 142
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 179
LDI r6, 68
LDI r7, 53
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
