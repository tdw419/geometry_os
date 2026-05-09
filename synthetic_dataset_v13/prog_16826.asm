; DESCRIPTION: Composite: Renders a magenta box of size 92x35 starting at (143, 203) then Draws a red line from (417, 192) to (236, 239).
; PLAN: r0=143(x), r1=203(y), r2=92(width), r3=35(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=417(x1), r6=192(y1), r7=236(x2), r8=239(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 143
LDI r1, 203
LDI r2, 92
LDI r3, 35
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 417
LDI r6, 192
LDI r7, 236
LDI r8, 239
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
