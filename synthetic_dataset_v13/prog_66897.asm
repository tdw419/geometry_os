; DESCRIPTION: Composite: Draws a white line from (253, 238) to (200, 86) then Renders a yellow box of size 96x14 starting at (208, 7).
; PLAN: r0=253(x1), r1=238(y1), r2=200(x2), r3=86(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=7(y), r7=96(width), r8=14(height), r9=0xFFFF00(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 253
LDI r1, 238
LDI r2, 200
LDI r3, 86
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 7
LDI r7, 96
LDI r8, 14
LDI r9, 0xFFFF00
RECTF r5, r6, r7, r8, r9
HALT
