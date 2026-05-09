; DESCRIPTION: Composite: Creates a blue rectangular region at (271, 119) spanning 86 by 70 pixels then Renders a green line between points (76, 30) and (74, 173).
; PLAN: r0=271(x), r1=119(y), r2=86(width), r3=70(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=76(x1), r6=30(y1), r7=74(x2), r8=173(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 119
LDI r2, 86
LDI r3, 70
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 76
LDI r6, 30
LDI r7, 74
LDI r8, 173
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
