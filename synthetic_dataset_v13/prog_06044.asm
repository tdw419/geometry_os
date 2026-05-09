; DESCRIPTION: Composite: Renders a green disk with center (97, 92) and radius 67 then Draws a red line from (60, 174) to (215, 180).
; PLAN: r0=97(x), r1=92(y), r2=67(radius), r3=0x00FF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=60(x1), r6=174(y1), r7=215(x2), r8=180(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 97
LDI r1, 92
LDI r2, 67
LDI r3, 0x00FF00
CIRCLE r0, r1, r2, r3
LDI r5, 60
LDI r6, 174
LDI r7, 215
LDI r8, 180
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
