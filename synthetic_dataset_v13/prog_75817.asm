; DESCRIPTION: Composite: Renders a magenta box of size 24x88 starting at (112, 86) then Draws a white line from (160, 79) to (354, 103).
; PLAN: r0=112(x), r1=86(y), r2=24(width), r3=88(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=160(x1), r6=79(y1), r7=354(x2), r8=103(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 112
LDI r1, 86
LDI r2, 24
LDI r3, 88
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 160
LDI r6, 79
LDI r7, 354
LDI r8, 103
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
