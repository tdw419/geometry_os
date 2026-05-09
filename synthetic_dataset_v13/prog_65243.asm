; DESCRIPTION: Composite: Places a white circle of radius 19 at center (277, 200) then Places a magenta line segment connecting (265, 27) to (22, 239).
; PLAN: r0=277(x), r1=200(y), r2=19(radius), r3=0xFFFFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x1), r6=27(y1), r7=22(x2), r8=239(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 277
LDI r1, 200
LDI r2, 19
LDI r3, 0xFFFFFF
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 27
LDI r7, 22
LDI r8, 239
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
