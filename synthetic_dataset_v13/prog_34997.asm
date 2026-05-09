; DESCRIPTION: Composite: Sets a single red pixel at (217, 72) then Renders a blue disk with center (362, 162) and radius 64 then Places a green line segment connecting (59, 116) to (381, 60).
; PLAN: r0=217(x), r1=72(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=362(x), r6=162(y), r7=64(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=59(x1), r11=116(y1), r12=381(x2), r13=60(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 217
LDI r1, 72
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 362
LDI r6, 162
LDI r7, 64
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 59
LDI r11, 116
LDI r12, 381
LDI r13, 60
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
