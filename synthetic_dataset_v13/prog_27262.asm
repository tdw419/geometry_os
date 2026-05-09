; DESCRIPTION: Composite: Renders a orange box of size 31x78 starting at (289, 168) then Draws a green line from (205, 73) to (247, 99).
; PLAN: r0=289(x), r1=168(y), r2=31(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=205(x1), r6=73(y1), r7=247(x2), r8=99(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 289
LDI r1, 168
LDI r2, 31
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
LDI r5, 205
LDI r6, 73
LDI r7, 247
LDI r8, 99
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
HALT
