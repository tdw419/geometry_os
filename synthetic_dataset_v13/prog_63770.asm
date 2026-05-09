; DESCRIPTION: Composite: Creates a white circular shape at (163, 124) with radius 57 then Renders a blue line between points (284, 94) and (321, 141).
; PLAN: r0=163(x), r1=124(y), r2=57(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=284(x1), r6=94(y1), r7=321(x2), r8=141(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 163
LDI r1, 124
LDI r2, 57
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 284
LDI r6, 94
LDI r7, 321
LDI r8, 141
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
