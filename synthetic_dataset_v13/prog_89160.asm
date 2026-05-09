; DESCRIPTION: Composite: Sets a single yellow pixel at (418, 151) then Renders a red line between points (500, 32) and (420, 184) then Renders a orange box of size 92x38 starting at (322, 122).
; PLAN: r0=418(x), r1=151(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=500(x1), r6=32(y1), r7=420(x2), r8=184(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=322(x), r11=122(y), r12=92(width), r13=38(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 418
LDI r1, 151
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 500
LDI r6, 32
LDI r7, 420
LDI r8, 184
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 322
LDI r11, 122
LDI r12, 92
LDI r13, 38
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
