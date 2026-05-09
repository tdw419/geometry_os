; DESCRIPTION: Composite: Places a magenta circle of radius 61 at center (297, 155) then Sets a single cyan pixel at (171, 236) then Renders a blue box of size 99x74 starting at (68, 169).
; PLAN: r0=297(x), r1=155(y), r2=61(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=171(x), r6=236(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7 Next: r10=68(x), r11=169(y), r12=99(width), r13=74(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 297
LDI r1, 155
LDI r2, 61
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 171
LDI r6, 236
LDI r7, 0x00FFFF
PSET r5, r6, r7
LDI r10, 68
LDI r11, 169
LDI r12, 99
LDI r13, 74
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
