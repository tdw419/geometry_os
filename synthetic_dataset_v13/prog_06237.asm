; DESCRIPTION: Composite: Places a yellow line segment connecting (122, 159) to (216, 197) then Places a white circle of radius 12 at center (138, 16).
; PLAN: r0=122(x1), r1=159(y1), r2=216(x2), r3=197(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=138(x), r6=16(y), r7=12(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 122
LDI r1, 159
LDI r2, 216
LDI r3, 197
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 138
LDI r6, 16
LDI r7, 12
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
