; DESCRIPTION: Composite: Draws a cyan line from (412, 171) to (62, 173) then Sets a single black pixel at (52, 169).
; PLAN: r0=412(x1), r1=171(y1), r2=62(x2), r3=173(y2), r4=0x00FFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=52(x), r6=169(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 412
LDI r1, 171
LDI r2, 62
LDI r3, 173
LDI r4, 0x00FFFF
LINE r0, r1, r2, r3, r4
LDI r5, 52
LDI r6, 169
LDI r7, 0x000000
PSET r5, r6, r7
HALT
