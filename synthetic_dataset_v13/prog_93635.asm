; DESCRIPTION: Composite: Sets a single purple pixel at (455, 116) then Creates a white rectangular region at (404, 127) spanning 30 by 112 pixels then Renders a magenta disk with center (176, 177) and radius 11.
; PLAN: r0=455(x), r1=116(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=404(x), r6=127(y), r7=30(width), r8=112(height), r9=0xFFFFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=176(x), r11=177(y), r12=11(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 455
LDI r1, 116
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 404
LDI r6, 127
LDI r7, 30
LDI r8, 112
LDI r9, 0xFFFFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 176
LDI r11, 177
LDI r12, 11
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
