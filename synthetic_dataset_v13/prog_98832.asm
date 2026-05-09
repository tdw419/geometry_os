; DESCRIPTION: Composite: Draws a green line from (356, 204) to (454, 222) then Renders a magenta box of size 52x94 starting at (67, 52).
; PLAN: r0=356(x1), r1=204(y1), r2=454(x2), r3=222(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=67(x), r6=52(y), r7=52(width), r8=94(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 356
LDI r1, 204
LDI r2, 454
LDI r3, 222
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 67
LDI r6, 52
LDI r7, 52
LDI r8, 94
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
