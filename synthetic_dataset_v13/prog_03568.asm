; DESCRIPTION: Composite: Places a cyan dot at position (216, 153) then Draws a cyan circle centered at (249, 176) with radius 24 then Renders a blue box of size 21x10 starting at (178, 192).
; PLAN: r0=216(x), r1=153(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=249(x), r6=176(y), r7=24(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=178(x), r11=192(y), r12=21(width), r13=10(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 216
LDI r1, 153
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 249
LDI r6, 176
LDI r7, 24
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 178
LDI r11, 192
LDI r12, 21
LDI r13, 10
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
