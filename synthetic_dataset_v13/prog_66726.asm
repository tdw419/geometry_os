; DESCRIPTION: Composite: Renders a purple line between points (52, 146) and (230, 152) then Places a red 28x114 rectangle at position (343, 134).
; PLAN: r0=52(x1), r1=146(y1), r2=230(x2), r3=152(y2), r4=0xAA00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=343(x), r6=134(y), r7=28(width), r8=114(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 52
LDI r1, 146
LDI r2, 230
LDI r3, 152
LDI r4, 0xAA00FF
LINE r0, r1, r2, r3, r4
LDI r5, 343
LDI r6, 134
LDI r7, 28
LDI r8, 114
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
