; DESCRIPTION: Composite: Sets a single magenta pixel at (233, 36) then Places a magenta line segment connecting (211, 152) to (14, 148) then Places a blue 100x98 rectangle at position (373, 139).
; PLAN: r0=233(x), r1=36(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=211(x1), r6=152(y1), r7=14(x2), r8=148(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=373(x), r11=139(y), r12=100(width), r13=98(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 233
LDI r1, 36
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 211
LDI r6, 152
LDI r7, 14
LDI r8, 148
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 373
LDI r11, 139
LDI r12, 100
LDI r13, 98
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
