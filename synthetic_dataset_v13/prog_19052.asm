; DESCRIPTION: Composite: Draws a black line from (235, 71) to (498, 115) then Places a red 98x43 rectangle at position (208, 102).
; PLAN: r0=235(x1), r1=71(y1), r2=498(x2), r3=115(y2), r4=0x000000(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=208(x), r6=102(y), r7=98(width), r8=43(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 235
LDI r1, 71
LDI r2, 498
LDI r3, 115
LDI r4, 0x000000
LINE r0, r1, r2, r3, r4
LDI r5, 208
LDI r6, 102
LDI r7, 98
LDI r8, 43
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
