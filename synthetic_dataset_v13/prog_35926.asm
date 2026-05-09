; DESCRIPTION: Composite: Draws a orange line from (267, 98) to (471, 62) then Renders a orange disk with center (404, 74) and radius 67 then Creates a magenta rectangular region at (42, 9) spanning 73 by 107 pixels.
; PLAN: r0=267(x1), r1=98(y1), r2=471(x2), r3=62(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=404(x), r6=74(y), r7=67(radius), r8=0xFF8800(color). Op: CIRCLE r5, r6, r7, r8 Next: r10=42(x), r11=9(y), r12=73(width), r13=107(height), r14=0xFF00FF(color). Op: RECTF r10, r11, r12, r13, r14.
LDI r0, 267
LDI r1, 98
LDI r2, 471
LDI r3, 62
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 404
LDI r6, 74
LDI r7, 67
LDI r8, 0xFF8800
CIRCLE r5, r6, r7, r8
LDI r10, 42
LDI r11, 9
LDI r12, 73
LDI r13, 107
LDI r14, 0xFF00FF
RECTF r10, r11, r12, r13, r14
HALT
