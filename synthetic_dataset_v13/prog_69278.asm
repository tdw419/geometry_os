; DESCRIPTION: Composite: Creates a magenta rectangular region at (442, 92) spanning 56 by 28 pixels then Places a magenta line segment connecting (69, 65) to (130, 121).
; PLAN: r0=442(x), r1=92(y), r2=56(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=69(x1), r6=65(y1), r7=130(x2), r8=121(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 442
LDI r1, 92
LDI r2, 56
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 69
LDI r6, 65
LDI r7, 130
LDI r8, 121
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
