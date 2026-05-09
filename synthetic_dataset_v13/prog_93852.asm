; DESCRIPTION: Composite: Draws a red line from (280, 128) to (96, 220) then Renders a magenta box of size 21x82 starting at (108, 81).
; PLAN: r0=280(x1), r1=128(y1), r2=96(x2), r3=220(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=108(x), r6=81(y), r7=21(width), r8=82(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 280
LDI r1, 128
LDI r2, 96
LDI r3, 220
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 108
LDI r6, 81
LDI r7, 21
LDI r8, 82
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
