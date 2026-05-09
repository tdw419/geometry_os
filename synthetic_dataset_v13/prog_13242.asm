; DESCRIPTION: Composite: Places a white circle of radius 45 at center (347, 81) then Draws a green line from (35, 247) to (329, 20).
; PLAN: r0=347(x), r1=81(y), r2=45(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=35(x1), r6=247(y1), r7=329(x2), r8=20(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 347
LDI r1, 81
LDI r2, 45
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 35
LDI r6, 247
LDI r7, 329
LDI r8, 20
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
