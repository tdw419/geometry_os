; DESCRIPTION: Composite: Renders a orange box of size 48x63 starting at (174, 35) then Draws a blue line from (403, 129) to (426, 223) then Creates a blue circular shape at (246, 161) with radius 75.
; PLAN: r0=174(x), r1=35(y), r2=48(width), r3=63(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=403(x1), r6=129(y1), r7=426(x2), r8=223(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=246(x), r11=161(y), r12=75(radius), r13=0x0000FF(color). Op: CIRCLE r10, r11, r12, r13.
LDI r0, 174
LDI r1, 35
LDI r2, 48
LDI r3, 63
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 403
LDI r6, 129
LDI r7, 426
LDI r8, 223
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
LDI r10, 246
LDI r11, 161
LDI r12, 75
LDI r13, 0x0000FF
CIRCLE r10, r11, r12, r13
HALT
