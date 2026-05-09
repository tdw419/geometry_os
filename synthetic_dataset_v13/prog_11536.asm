; DESCRIPTION: Composite: Renders a yellow box of size 58x112 starting at (389, 66) then Places a red line segment connecting (422, 222) to (239, 12).
; PLAN: r0=389(x), r1=66(y), r2=58(width), r3=112(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=422(x1), r6=222(y1), r7=239(x2), r8=12(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 66
LDI r2, 58
LDI r3, 112
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 422
LDI r6, 222
LDI r7, 239
LDI r8, 12
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
