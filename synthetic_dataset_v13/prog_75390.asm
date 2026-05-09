; DESCRIPTION: Composite: Renders a black box of size 87x61 starting at (402, 92) then Draws a blue line from (130, 169) to (384, 10).
; PLAN: r0=402(x), r1=92(y), r2=87(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=130(x1), r6=169(y1), r7=384(x2), r8=10(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 402
LDI r1, 92
LDI r2, 87
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 130
LDI r6, 169
LDI r7, 384
LDI r8, 10
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
