; DESCRIPTION: Composite: Renders a magenta line between points (219, 118) and (115, 69) then Places a orange 36x74 rectangle at position (298, 66).
; PLAN: r0=219(x1), r1=118(y1), r2=115(x2), r3=69(y2), r4=0xFF00FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=298(x), r6=66(y), r7=36(width), r8=74(height), r9=0xFF8800(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 219
LDI r1, 118
LDI r2, 115
LDI r3, 69
LDI r4, 0xFF00FF
LINE r0, r1, r2, r3, r4
LDI r5, 298
LDI r6, 66
LDI r7, 36
LDI r8, 74
LDI r9, 0xFF8800
RECTF r5, r6, r7, r8, r9
HALT
