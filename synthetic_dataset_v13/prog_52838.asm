; DESCRIPTION: Composite: Places a blue circle of radius 39 at center (203, 202) then Places a cyan line segment connecting (428, 7) to (425, 129).
; PLAN: r0=203(x), r1=202(y), r2=39(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=428(x1), r6=7(y1), r7=425(x2), r8=129(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 203
LDI r1, 202
LDI r2, 39
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 428
LDI r6, 7
LDI r7, 425
LDI r8, 129
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
