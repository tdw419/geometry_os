; DESCRIPTION: Composite: Draws a black line from (167, 225) to (254, 178) then Renders a red box of size 12x100 starting at (332, 139).
; PLAN: r0=167(x1), r1=225(y1), r2=254(x2), r3=178(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=332(x), r6=139(y), r7=12(width), r8=100(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 167
LDI r1, 225
LDI r2, 254
LDI r3, 178
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 332
LDI r6, 139
LDI r7, 12
LDI r8, 100
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
