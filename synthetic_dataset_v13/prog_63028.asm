; DESCRIPTION: Composite: Draws a cyan line from (124, 185) to (480, 170) then Renders a cyan disk with center (148, 174) and radius 67.
; PLAN: r0=124(x1), r1=185(y1), r2=480(x2), r3=170(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=148(x), r6=174(y), r7=67(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 124
LDI r1, 185
LDI r2, 480
LDI r3, 170
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 148
LDI r6, 174
LDI r7, 67
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
HALT
