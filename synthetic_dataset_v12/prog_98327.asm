; DESCRIPTION: Composite: Places a blue circle of radius 61 at center (239, 143) then Places a red line segment connecting (14, 134) to (178, 254).
; PLAN: r0=239(x), r1=143(y), r2=61(radius), r3=0x0000FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=14(x1), r6=134(y1), r7=178(x2), r8=254(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 239
LDI r1, 143
LDI r2, 61
LDI r3, 0x0000FF
CIRCLE r0, r1, r2, r3
LDI r5, 14
LDI r6, 134
LDI r7, 178
LDI r8, 254
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
