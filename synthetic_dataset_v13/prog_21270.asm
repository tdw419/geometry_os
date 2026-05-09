; DESCRIPTION: Composite: Draws a red line from (174, 192) to (236, 24) then Renders a red box of size 63x35 starting at (320, 22).
; PLAN: r0=174(x1), r1=192(y1), r2=236(x2), r3=24(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=320(x), r6=22(y), r7=63(width), r8=35(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 174
LDI r1, 192
LDI r2, 236
LDI r3, 24
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 320
LDI r6, 22
LDI r7, 63
LDI r8, 35
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
