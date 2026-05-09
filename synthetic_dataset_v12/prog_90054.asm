; DESCRIPTION: Composite: Places a red circle of radius 12 at center (33, 38) then Renders a cyan line between points (11, 233) and (64, 110).
; PLAN: r0=33(x), r1=38(y), r2=12(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=11(x1), r6=233(y1), r7=64(x2), r8=110(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 33
LDI r1, 38
LDI r2, 12
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
LDI r5, 11
LDI r6, 233
LDI r7, 64
LDI r8, 110
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
