; DESCRIPTION: Composite: Places a white circle of radius 37 at center (364, 155) then Draws a cyan line from (473, 233) to (185, 218).
; PLAN: r0=364(x), r1=155(y), r2=37(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=473(x1), r6=233(y1), r7=185(x2), r8=218(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 364
LDI r1, 155
LDI r2, 37
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 473
LDI r6, 233
LDI r7, 185
LDI r8, 218
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
