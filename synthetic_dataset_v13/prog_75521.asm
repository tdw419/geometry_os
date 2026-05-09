; DESCRIPTION: Composite: Places a yellow dot at position (262, 213) then Places a red line segment connecting (25, 81) to (175, 118).
; PLAN: r0=262(x), r1=213(y), r2=0xFFFF00(color). Op: PSET r0, r1, r2 Next: r5=25(x1), r6=81(y1), r7=175(x2), r8=118(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 262
LDI r1, 213
LDI r2, 0xFFFF00
PSET r0, r1, r2
LDI r5, 25
LDI r6, 81
LDI r7, 175
LDI r8, 118
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
HALT
