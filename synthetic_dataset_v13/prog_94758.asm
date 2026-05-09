; DESCRIPTION: Composite: Renders a blue box of size 28x71 starting at (475, 20) then Renders a yellow line between points (379, 78) and (346, 203).
; PLAN: r0=475(x), r1=20(y), r2=28(width), r3=71(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=379(x1), r6=78(y1), r7=346(x2), r8=203(y2), r9=0xFFFF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 475
LDI r1, 20
LDI r2, 28
LDI r3, 71
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 379
LDI r6, 78
LDI r7, 346
LDI r8, 203
LDI r9, 0xFFFF00
LINE r5, r6, r7, r8, r9
HALT
