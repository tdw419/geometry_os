; DESCRIPTION: Composite: Places a cyan dot at position (503, 171) then Renders a orange line between points (491, 129) and (437, 224) then Draws a magenta circle centered at (411, 78) with radius 42.
; PLAN: r0=503(x), r1=171(y), r2=0x00FFFF(color). Op: PSET r0, r1, r2 Next: r5=491(x1), r6=129(y1), r7=437(x2), r8=224(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=411(x), r11=78(y), r12=42(radius), r13=0xFF00FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 503
LDI r1, 171
LDI r2, 0x00FFFF
PSET r0, r1, r2
LDI r5, 491
LDI r6, 129
LDI r7, 437
LDI r8, 224
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 411
LDI r11, 78
LDI r12, 42
LDI r13, 0xFF00FF
CIRCLE r10, r11, r12, r13
HALT
