; DESCRIPTION: Composite: Renders a magenta box of size 46x28 starting at (154, 217) then Renders a magenta line between points (454, 67) and (18, 224).
; PLAN: r0=154(x), r1=217(y), r2=46(width), r3=28(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=454(x1), r6=67(y1), r7=18(x2), r8=224(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 154
LDI r1, 217
LDI r2, 46
LDI r3, 28
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 454
LDI r6, 67
LDI r7, 18
LDI r8, 224
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
HALT
