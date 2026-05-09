; DESCRIPTION: Composite: Draws a red line from (214, 172) to (219, 80) then Renders a yellow box of size 33x86 starting at (6, 20).
; PLAN: r0=214(x1), r1=172(y1), r2=219(x2), r3=80(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=6(x), r6=20(y), r7=33(width), r8=86(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 214
LDI r1, 172
LDI r2, 219
LDI r3, 80
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 6
LDI r6, 20
LDI r7, 33
LDI r8, 86
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
