; DESCRIPTION: Composite: Sets a single green pixel at (38, 227) then Renders a red disk with center (415, 155) and radius 15 then Renders a orange box of size 102x11 starting at (202, 85).
; PLAN: r0=38(x), r1=227(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=415(x), r6=155(y), r7=15(radius), r8=0xFF0000(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=202(x), r11=85(y), r12=102(width), r13=11(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 38
LDI r1, 227
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 415
LDI r6, 155
LDI r7, 15
LDI r8, 0xFF0000
CIRCLE r5, r6, r7, r8
LDI r10, 202
LDI r11, 85
LDI r12, 102
LDI r13, 11
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
