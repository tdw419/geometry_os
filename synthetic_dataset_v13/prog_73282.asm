; DESCRIPTION: Composite: Renders a white line between points (190, 72) and (263, 109) then Renders a purple box of size 34x63 starting at (271, 67).
; PLAN: r0=190(x1), r1=72(y1), r2=263(x2), r3=109(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=271(x), r6=67(y), r7=34(width), r8=63(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 190
LDI r1, 72
LDI r2, 263
LDI r3, 109
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 271
LDI r6, 67
LDI r7, 34
LDI r8, 63
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
HALT
