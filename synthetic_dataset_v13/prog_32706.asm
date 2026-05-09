; DESCRIPTION: Composite: Places a red circle of radius 61 at center (409, 175) then Renders a cyan line between points (360, 6) and (22, 118).
; PLAN: r0=409(x), r1=175(y), r2=61(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=360(x1), r6=6(y1), r7=22(x2), r8=118(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 409
LDI r1, 175
LDI r2, 61
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 360
LDI r6, 6
LDI r7, 22
LDI r8, 118
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
