; DESCRIPTION: Composite: Places a black 58x81 rectangle at position (389, 90) then Renders a white line between points (182, 101) and (251, 146).
; PLAN: r0=389(x), r1=90(y), r2=58(width), r3=81(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=182(x1), r6=101(y1), r7=251(x2), r8=146(y2), r9=0xFFFFFF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 389
LDI r1, 90
LDI r2, 58
LDI r3, 81
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
LDI r5, 182
LDI r6, 101
LDI r7, 251
LDI r8, 146
LDI r9, 0xFFFFFF
LINE r5, r6, r7, r8, r9
HALT
