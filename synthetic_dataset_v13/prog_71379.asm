; DESCRIPTION: Composite: Creates a orange rectangular region at (346, 65) spanning 84 by 23 pixels then Renders a red line between points (362, 176) and (28, 63) then Renders a red disk with center (234, 129) and radius 60.
; PLAN: r0=346(x), r1=65(y), r2=84(width), r3=23(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=362(x1), r6=176(y1), r7=28(x2), r8=63(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=234(x), r11=129(y), r12=60(radius), r13=0xFF0000(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 346
LDI r1, 65
LDI r2, 84
LDI r3, 23
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 362
LDI r6, 176
LDI r7, 28
LDI r8, 63
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 234
LDI r11, 129
LDI r12, 60
LDI r13, 0xFF0000
CIRCLE r10, r11, r12, r13
HALT
