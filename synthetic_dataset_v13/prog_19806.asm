; DESCRIPTION: Composite: Draws a yellow line from (357, 227) to (270, 10) then Creates a yellow rectangular region at (346, 32) spanning 27 by 25 pixels.
; PLAN: r0=357(x1), r1=227(y1), r2=270(x2), r3=10(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=346(x), r6=32(y), r7=27(width), r8=25(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 357
LDI r1, 227
LDI r2, 270
LDI r3, 10
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 346
LDI r6, 32
LDI r7, 27
LDI r8, 25
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
