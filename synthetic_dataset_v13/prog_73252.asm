; DESCRIPTION: Composite: Renders a blue line between points (335, 173) and (206, 67) then Creates a blue rectangular region at (30, 106) spanning 117 by 76 pixels.
; PLAN: r0=335(x1), r1=173(y1), r2=206(x2), r3=67(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=30(x), r6=106(y), r7=117(width), r8=76(height), r9=0x0000FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 335
LDI r1, 173
LDI r2, 206
LDI r3, 67
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 30
LDI r6, 106
LDI r7, 117
LDI r8, 76
LDI r9, 0x0000FF
RECTF r5, r6, r7, r8, r9
HALT
