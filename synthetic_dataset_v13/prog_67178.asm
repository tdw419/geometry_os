; DESCRIPTION: Composite: Places a magenta line segment connecting (453, 194) to (368, 69) then Renders a purple box of size 103x63 starting at (49, 1).
; PLAN: r0=453(x1), r1=194(y1), r2=368(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=49(x), r6=1(y), r7=103(width), r8=63(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 453
LDI r1, 194
LDI r2, 368
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 49
LDI r6, 1
LDI r7, 103
LDI r8, 63
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
