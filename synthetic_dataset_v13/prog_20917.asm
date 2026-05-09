; DESCRIPTION: Composite: Creates a purple circular shape at (413, 209) with radius 30 then Renders a green line between points (458, 249) and (411, 7).
; PLAN: r0=413(x), r1=209(y), r2=30(radius), r3=0xAA00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=458(x1), r6=249(y1), r7=411(x2), r8=7(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 413
LDI r1, 209
LDI r2, 30
LDI r3, 0xAA00FF
CIRCLE r0, r1, r2, r3
LDI r5, 458
LDI r6, 249
LDI r7, 411
LDI r8, 7
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
