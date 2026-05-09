; DESCRIPTION: Composite: Places a green dot at position (35, 88) then Draws a red line from (399, 28) to (249, 186).
; PLAN: r0=35(x), r1=88(y), r2=0x00FF00(color). Op: PSET r0, r1, r2 Next: r5=399(x1), r6=28(y1), r7=249(x2), r8=186(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 35
LDI r1, 88
LDI r2, 0x00FF00
PSET r0, r1, r2
LDI r5, 399
LDI r6, 28
LDI r7, 249
LDI r8, 186
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
