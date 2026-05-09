; DESCRIPTION: Composite: Renders a blue box of size 117x30 starting at (271, 70) then Draws a blue line from (117, 98) to (271, 172).
; PLAN: r0=271(x), r1=70(y), r2=117(width), r3=30(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=117(x1), r6=98(y1), r7=271(x2), r8=172(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 271
LDI r1, 70
LDI r2, 117
LDI r3, 30
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 117
LDI r6, 98
LDI r7, 271
LDI r8, 172
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
