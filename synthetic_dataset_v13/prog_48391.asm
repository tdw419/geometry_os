; DESCRIPTION: Composite: Places a yellow dot at position (86, 101) then Renders a green disk with center (246, 72) and radius 69 then Draws a green line from (249, 242) to (320, 196).
; PLAN: r0=86(x), r1=101(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=246(x), r6=72(y), r7=69(radius), r8=0x00FF00(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=249(x1), r11=242(y1), r12=320(x2), r13=196(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 86
LDI r1, 101
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 246
LDI r6, 72
LDI r7, 69
LDI r8, 0x00FF00
CIRCLE r5, r6, r7, r8
LDI r10, 249
LDI r11, 242
LDI r12, 320
LDI r13, 196
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
