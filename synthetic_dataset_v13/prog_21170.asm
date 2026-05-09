; DESCRIPTION: Composite: Places a white circle of radius 25 at center (313, 157) then Renders a orange line between points (66, 68) and (210, 129).
; PLAN: r0=313(x), r1=157(y), r2=25(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=66(x1), r6=68(y1), r7=210(x2), r8=129(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 313
LDI r1, 157
LDI r2, 25
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 66
LDI r6, 68
LDI r7, 210
LDI r8, 129
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
