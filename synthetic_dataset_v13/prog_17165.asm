; DESCRIPTION: Composite: Draws a magenta line from (426, 245) to (365, 168) then Places a blue circle of radius 72 at center (193, 184) then Creates a orange rectangular region at (283, 166) spanning 74 by 61 pixels.
; PLAN: r0=426(x1), r1=245(y1), r2=365(x2), r3=168(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=193(x), r6=184(y), r7=72(radius), r8=0x0000FF(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=283(x), r11=166(y), r12=74(width), r13=61(height), r14=0xFF8800(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 426
LDI r1, 245
LDI r2, 365
LDI r3, 168
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 193
LDI r6, 184
LDI r7, 72
LDI r8, 0x0000FF
CIRCLE r5, r6, r7, r8
LDI r10, 283
LDI r11, 166
LDI r12, 74
LDI r13, 61
LDI r14, 0xFF8800
RECTF r10, r11, r12, r13, r14
HALT
