; DESCRIPTION: Composite: Creates a cyan circular shape at (436, 111) with radius 38 then Draws a cyan rectangle at (285, 46) with width 77 and height 56 then Draws a cyan line from (356, 36) to (172, 78).
; PLAN: r0=436(x), r1=111(y), r2=38(radius), r3=0x00FFFF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=285(x), r6=46(y), r7=77(width), r8=56(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=356(x1), r11=36(y1), r12=172(x2), r13=78(y2), r14=0x00FFFF(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 436
LDI r1, 111
LDI r2, 38
LDI r3, 0x00FFFF
CIRCLE r0, r1, r2, r3
LDI r5, 285
LDI r6, 46
LDI r7, 77
LDI r8, 56
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
LDI r10, 356
LDI r11, 36
LDI r12, 172
LDI r13, 78
LDI r14, 0x00FFFF
LINE r10, r11, r12, r13, r14
HALT
