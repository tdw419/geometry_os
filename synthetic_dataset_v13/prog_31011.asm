; DESCRIPTION: Composite: Draws a magenta line from (367, 181) to (231, 221) then Renders a orange box of size 29x111 starting at (275, 129).
; PLAN: r0=367(x1), r1=181(y1), r2=231(x2), r3=221(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=275(x), r6=129(y), r7=29(width), r8=111(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 181
LDI r2, 231
LDI r3, 221
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 275
LDI r6, 129
LDI r7, 29
LDI r8, 111
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
