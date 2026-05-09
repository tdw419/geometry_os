; DESCRIPTION: Composite: Renders a magenta box of size 100x86 starting at (316, 32) then Draws a blue line from (150, 59) to (500, 81).
; PLAN: r0=316(x), r1=32(y), r2=100(width), r3=86(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=150(x1), r6=59(y1), r7=500(x2), r8=81(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 316
LDI r1, 32
LDI r2, 100
LDI r3, 86
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 150
LDI r6, 59
LDI r7, 500
LDI r8, 81
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
