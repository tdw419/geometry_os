; DESCRIPTION: Composite: Sets a single purple pixel at (440, 21) then Renders a magenta disk with center (403, 203) and radius 49 then Draws a green line from (92, 16) to (467, 179).
; PLAN: r0=440(x), r1=21(y), r2=0xAA00FF(color). Op: PSET r0, r1, r2 Next: r5=403(x), r6=203(y), r7=49(radius), r8=0xFF00FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=92(x1), r11=16(y1), r12=467(x2), r13=179(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 440
LDI r1, 21
LDI r2, 0xAA00FF
PSET r0, r1, r2
LDI r5, 403
LDI r6, 203
LDI r7, 49
LDI r8, 0xFF00FF
CIRCLE r5, r6, r7, r8
LDI r10, 92
LDI r11, 16
LDI r12, 467
LDI r13, 179
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
