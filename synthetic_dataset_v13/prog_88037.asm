; DESCRIPTION: Composite: Renders a purple box of size 113x76 starting at (326, 153) then Places a red line segment connecting (290, 41) to (169, 70).
; PLAN: r0=326(x), r1=153(y), r2=113(width), r3=76(height), r4=0xAA00FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=290(x1), r6=41(y1), r7=169(x2), r8=70(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 326
LDI r1, 153
LDI r2, 113
LDI r3, 76
LDI r4, 0xAA00FF
RECTF r0, r1, r2, r3, r4
LDI r5, 290
LDI r6, 41
LDI r7, 169
LDI r8, 70
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
