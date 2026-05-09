; DESCRIPTION: Composite: Renders a yellow line between points (123, 164) and (25, 153) then Renders a black box of size 19x113 starting at (3, 35).
; PLAN: r0=123(x1), r1=164(y1), r2=25(x2), r3=153(y2), r4=0xFFFF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=3(x), r6=35(y), r7=19(width), r8=113(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 123
LDI r1, 164
LDI r2, 25
LDI r3, 153
LDI r4, 0xFFFF00
LINE r0, r1, r2, r3, r4
LDI r5, 3
LDI r6, 35
LDI r7, 19
LDI r8, 113
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
