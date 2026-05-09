; DESCRIPTION: Composite: Renders a yellow box of size 77x60 starting at (130, 6) then Places a black line segment connecting (27, 246) to (309, 92).
; PLAN: r0=130(x), r1=6(y), r2=77(width), r3=60(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=27(x1), r6=246(y1), r7=309(x2), r8=92(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 130
LDI r1, 6
LDI r2, 77
LDI r3, 60
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 27
LDI r6, 246
LDI r7, 309
LDI r8, 92
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
