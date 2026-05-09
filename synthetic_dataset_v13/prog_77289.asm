; DESCRIPTION: Composite: Places a green dot at position (143, 234) then Creates a blue circular shape at (126, 171) with radius 14 then Renders a green box of size 106x96 starting at (297, 80).
; PLAN: r0=143(x), r1=234(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=126(x), r6=171(y), r7=14(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=297(x), r11=80(y), r12=106(width), r13=96(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 143
LDI r1, 234
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 126
LDI r6, 171
LDI r7, 14
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 297
LDI r11, 80
LDI r12, 106
LDI r13, 96
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
