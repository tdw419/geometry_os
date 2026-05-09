; DESCRIPTION: Composite: Sets a single yellow pixel at (487, 250) then Renders a magenta line between points (389, 184) and (475, 135) then Creates a blue rectangular region at (310, 205) spanning 63 by 21 pixels.
; PLAN: r0=487(x), r1=250(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=389(x1), r6=184(y1), r7=475(x2), r8=135(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=310(x), r11=205(y), r12=63(width), r13=21(height), r14=0x0000FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 487
LDI r1, 250
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 389
LDI r6, 184
LDI r7, 475
LDI r8, 135
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 310
LDI r11, 205
LDI r12, 63
LDI r13, 21
LDI r14, 0x0000FF
RECTF r10, r11, r12, r13, r14
HALT
