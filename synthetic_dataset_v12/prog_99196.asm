; DESCRIPTION: Composite: Places a yellow dot at position (274, 34) then Places a black line segment connecting (295, 136) to (0, 104).
; PLAN: r0=274(x), r1=34(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=295(x1), r6=136(y1), r7=0(x2), r8=104(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 274
LDI r1, 34
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 295
LDI r6, 136
LDI r7, 0
LDI r8, 104
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
