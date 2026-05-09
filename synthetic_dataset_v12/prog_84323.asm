; DESCRIPTION: Composite: Places a white circle of radius 50 at center (226, 112) then Places a green line segment connecting (319, 210) to (121, 172).
; PLAN: r0=226(x), r1=112(y), r2=50(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=319(x1), r6=210(y1), r7=121(x2), r8=172(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 226
LDI r1, 112
LDI r2, 50
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 319
LDI r6, 210
LDI r7, 121
LDI r8, 172
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
