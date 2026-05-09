; DESCRIPTION: Composite: Places a white circle of radius 27 at center (342, 175) then Draws a cyan line from (200, 43) to (492, 148).
; PLAN: r0=342(x), r1=175(y), r2=27(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=200(x1), r6=43(y1), r7=492(x2), r8=148(y2), r9=0x00FFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 342
LDI r1, 175
LDI r2, 27
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 200
LDI r6, 43
LDI r7, 492
LDI r8, 148
LDI r9, 0x00FFFF
LINE r5, r6, r7, r8, r9
HALT
