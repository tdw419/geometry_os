; DESCRIPTION: Composite: Places a red dot at position (403, 80) then Draws a cyan circle centered at (169, 128) with radius 34 then Renders a green box of size 63x38 starting at (88, 203).
; PLAN: r0=403(x), r1=80(y), r2=0xFF0000(color). Op: PSET r0, r1, r2 Next: r5=169(x), r6=128(y), r7=34(radius), r8=0x00FFFF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=88(x), r11=203(y), r12=63(width), r13=38(height), r14=0x00FF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 403
LDI r1, 80
LDI r2, 0xFF0000
PSET r0, r1, r2
LDI r5, 169
LDI r6, 128
LDI r7, 34
LDI r8, 0x00FFFF
CIRCLE r5, r6, r7, r8
LDI r10, 88
LDI r11, 203
LDI r12, 63
LDI r13, 38
LDI r14, 0x00FF00
RECTF r10, r11, r12, r13, r14
HALT
