; DESCRIPTION: Composite: Sets a single red pixel at (393, 33) then Renders a red disk with center (422, 112) and radius 72 then Draws a magenta rectangle at (186, 39) with width 119 and height 47.
; PLAN: r0=393(x), r1=33(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=422(x), r6=112(y), r7=72(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=186(x), r11=39(y), r12=119(width), r13=47(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 393
LDI r1, 33
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 422
LDI r6, 112
LDI r7, 72
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 186
LDI r11, 39
LDI r12, 119
LDI r13, 47
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
