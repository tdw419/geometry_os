; DESCRIPTION: Composite: Draws a green line from (103, 114) to (336, 102) then Creates a red rectangular region at (368, 48) spanning 93 by 19 pixels.
; PLAN: r0=103(x1), r1=114(y1), r2=336(x2), r3=102(y2), r4=0x00FF00(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=368(x), r6=48(y), r7=93(width), r8=19(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 103
LDI r1, 114
LDI r2, 336
LDI r3, 102
LDI r4, 0x00FF00
LINE r0, r1, r2, r3, r4
LDI r5, 368
LDI r6, 48
LDI r7, 93
LDI r8, 19
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
