; DESCRIPTION: Composite: Renders a orange line between points (213, 94) and (317, 145) then Places a orange 92x116 rectangle at position (378, 71).
; PLAN: r0=213(x1), r1=94(y1), r2=317(x2), r3=145(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=378(x), r6=71(y), r7=92(width), r8=116(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 213
LDI r1, 94
LDI r2, 317
LDI r3, 145
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 378
LDI r6, 71
LDI r7, 92
LDI r8, 116
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
