; DESCRIPTION: Composite: Places a cyan circle of radius 47 at center (463, 133) then Renders a purple line between points (9, 129) and (475, 114).
; PLAN: r0=463(x), r1=133(y), r2=47(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=9(x1), r6=129(y1), r7=475(x2), r8=114(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 463
LDI r1, 133
LDI r2, 47
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 9
LDI r6, 129
LDI r7, 475
LDI r8, 114
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
