; DESCRIPTION: Composite: Places a magenta line segment connecting (303, 49) to (403, 63) then Places a white circle of radius 27 at center (373, 74).
; PLAN: r0=303(x1), r1=49(y1), r2=403(x2), r3=63(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=373(x), r6=74(y), r7=27(radius), r8=0xFFFFFF(color). Op: CIRCLE r5, r6, r7, r8.
LDI r0, 303
LDI r1, 49
LDI r2, 403
LDI r3, 63
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 373
LDI r6, 74
LDI r7, 27
LDI r8, 0xFFFFFF
CIRCLE r5, r6, r7, r8
HALT
