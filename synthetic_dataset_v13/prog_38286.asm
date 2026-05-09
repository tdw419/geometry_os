; DESCRIPTION: Composite: Sets a single magenta pixel at (317, 235) then Renders a purple box of size 83x34 starting at (275, 90) then Draws a green line from (297, 38) to (401, 212).
; PLAN: r0=317(x), r1=235(y), r2=0xFF00FF(color). Op: PSET r0, r1, r2 Next: r5=275(x), r6=90(y), r7=83(width), r8=34(height), r9=0xAA00FF(color). Op: RECTF r5, r6, r7, r8, r9 Next: r10=297(x1), r11=38(y1), r12=401(x2), r13=212(y2), r14=0x00FF00(color). Op: LINE r10, r11, r12, r13, r14.
LDI r0, 317
LDI r1, 235
LDI r2, 0xFF00FF
PSET r0, r1, r2
LDI r5, 275
LDI r6, 90
LDI r7, 83
LDI r8, 34
LDI r9, 0xAA00FF
RECTF r5, r6, r7, r8, r9
LDI r10, 297
LDI r11, 38
LDI r12, 401
LDI r13, 212
LDI r14, 0x00FF00
LINE r10, r11, r12, r13, r14
HALT
