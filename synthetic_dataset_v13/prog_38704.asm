; DESCRIPTION: Composite: Draws a red line from (308, 81) to (92, 128) then Draws a red rectangle at (289, 83) with width 108 and height 101.
; PLAN: r0=308(x1), r1=81(y1), r2=92(x2), r3=128(y2), r4=0xFF0000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=289(x), r6=83(y), r7=108(width), r8=101(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 308
LDI r1, 81
LDI r2, 92
LDI r3, 128
LDI r4, 0xFF0000
LINE r0, r1, r2, r3, r4
LDI r5, 289
LDI r6, 83
LDI r7, 108
LDI r8, 101
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
