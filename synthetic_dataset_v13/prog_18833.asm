; DESCRIPTION: Composite: Places a green line segment connecting (261, 138) to (116, 173) then Renders a magenta box of size 52x112 starting at (450, 19).
; PLAN: r0=261(x1), r1=138(y1), r2=116(x2), r3=173(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=450(x), r6=19(y), r7=52(width), r8=112(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 261
LDI r1, 138
LDI r2, 116
LDI r3, 173
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 450
LDI r6, 19
LDI r7, 52
LDI r8, 112
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
