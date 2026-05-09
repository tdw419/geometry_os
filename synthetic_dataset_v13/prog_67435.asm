; DESCRIPTION: Composite: Places a white circle of radius 66 at center (144, 124) then Places a black line segment connecting (439, 129) to (6, 14).
; PLAN: r0=144(x), r1=124(y), r2=66(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=439(x1), r6=129(y1), r7=6(x2), r8=14(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 144
LDI r1, 124
LDI r2, 66
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 439
LDI r6, 129
LDI r7, 6
LDI r8, 14
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
