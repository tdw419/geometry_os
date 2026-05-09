; DESCRIPTION: Composite: Renders a white box of size 67x46 starting at (20, 198) then Renders a purple line between points (130, 122) and (267, 117).
; PLAN: r0=20(x), r1=198(y), r2=67(width), r3=46(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x1), r6=122(y1), r7=267(x2), r8=117(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 20
LDI r1, 198
LDI r2, 67
LDI r3, 46
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 122
LDI r7, 267
LDI r8, 117
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
HALT
