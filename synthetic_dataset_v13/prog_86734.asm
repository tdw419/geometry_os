; DESCRIPTION: Composite: Renders a green line between points (171, 191) and (454, 35) then Renders a orange box of size 41x12 starting at (377, 46).
; PLAN: r0=171(x1), r1=191(y1), r2=454(x2), r3=35(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=377(x), r6=46(y), r7=41(width), r8=12(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 171
LDI r1, 191
LDI r2, 454
LDI r3, 35
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 377
LDI r6, 46
LDI r7, 41
LDI r8, 12
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
