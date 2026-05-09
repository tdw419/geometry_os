; DESCRIPTION: Composite: Renders a red box of size 21x47 starting at (91, 102) then Draws a blue line from (406, 76) to (437, 36).
; PLAN: r0=91(x), r1=102(y), r2=21(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=406(x1), r6=76(y1), r7=437(x2), r8=36(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 91
LDI r1, 102
LDI r2, 21
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 406
LDI r6, 76
LDI r7, 437
LDI r8, 36
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
