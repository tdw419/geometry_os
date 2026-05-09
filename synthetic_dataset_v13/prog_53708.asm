; DESCRIPTION: Composite: Renders a green disk with center (296, 139) and radius 67 then Places a cyan line segment connecting (502, 172) to (65, 185).
; PLAN: r0=296(x), r1=139(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=502(x1), r6=172(y1), r7=65(x2), r8=185(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 296
LDI r1, 139
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 502
LDI r6, 172
LDI r7, 65
LDI r8, 185
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
