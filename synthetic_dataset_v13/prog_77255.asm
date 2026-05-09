; DESCRIPTION: Composite: Draws a red line from (367, 156) to (464, 28) then Creates a yellow rectangular region at (374, 140) spanning 67 by 40 pixels.
; PLAN: r0=367(x1), r1=156(y1), r2=464(x2), r3=28(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=374(x), r6=140(y), r7=67(width), r8=40(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 367
LDI r1, 156
LDI r2, 464
LDI r3, 28
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 374
LDI r6, 140
LDI r7, 67
LDI r8, 40
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
