; DESCRIPTION: Composite: Draws a green line from (205, 189) to (511, 92) then Renders a magenta box of size 52x116 starting at (250, 43).
; PLAN: r0=205(x1), r1=189(y1), r2=511(x2), r3=92(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=250(x), r6=43(y), r7=52(width), r8=116(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 205
LDI r1, 189
LDI r2, 511
LDI r3, 92
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 250
LDI r6, 43
LDI r7, 52
LDI r8, 116
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
