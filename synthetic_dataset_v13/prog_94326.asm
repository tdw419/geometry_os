; DESCRIPTION: Composite: Sets a single green pixel at (125, 44) then Renders a orange line between points (502, 76) and (169, 111) then Renders a yellow box of size 19x104 starting at (341, 28).
; PLAN: r0=125(x), r1=44(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=502(x1), r6=76(y1), r7=169(x2), r8=111(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=341(x), r11=28(y), r12=19(width), r13=104(height), r14=0xFFFF00(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 125
LDI r1, 44
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 502
LDI r6, 76
LDI r7, 169
LDI r8, 111
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 341
LDI r11, 28
LDI r12, 19
LDI r13, 104
LDI r14, 0xFFFF00
RECTF r10, r11, r12, r13, r14
HALT
