; DESCRIPTION: Composite: Renders a red box of size 36x41 starting at (393, 76) then Renders a green line between points (11, 160) and (482, 155).
; PLAN: r0=393(x), r1=76(y), r2=36(width), r3=41(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=11(x1), r6=160(y1), r7=482(x2), r8=155(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 393
LDI r1, 76
LDI r2, 36
LDI r3, 41
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 11
LDI r6, 160
LDI r7, 482
LDI r8, 155
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
