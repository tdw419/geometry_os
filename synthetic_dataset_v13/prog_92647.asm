; DESCRIPTION: Composite: Renders a orange box of size 94x108 starting at (169, 94) then Renders a orange line between points (180, 161) and (471, 214).
; PLAN: r0=169(x), r1=94(y), r2=94(width), r3=108(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=180(x1), r6=161(y1), r7=471(x2), r8=214(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 169
LDI r1, 94
LDI r2, 94
LDI r3, 108
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 180
LDI r6, 161
LDI r7, 471
LDI r8, 214
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
HALT
