; DESCRIPTION: Composite: Places a yellow line segment connecting (280, 131) to (209, 239) then Places a white circle of radius 59 at center (377, 118).
; PLAN: r0=280(x1), r1=131(y1), r2=209(x2), r3=239(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=118(y), r7=59(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 280
LDI r1, 131
LDI r2, 209
LDI r3, 239
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 118
LDI r7, 59
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
