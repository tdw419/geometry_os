; DESCRIPTION: Composite: Draws a cyan line from (492, 39) to (318, 169) then Renders a black box of size 14x21 starting at (221, 216).
; PLAN: r0=492(x1), r1=39(y1), r2=318(x2), r3=169(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=221(x), r6=216(y), r7=14(width), r8=21(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 492
LDI r1, 39
LDI r2, 318
LDI r3, 169
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 221
LDI r6, 216
LDI r7, 14
LDI r8, 21
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
