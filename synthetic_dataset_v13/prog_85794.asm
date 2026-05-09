; DESCRIPTION: Composite: Places a blue 117x102 rectangle at position (31, 74) then Renders a black line between points (10, 165) and (435, 57).
; PLAN: r0=31(x), r1=74(y), r2=117(width), r3=102(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=10(x1), r6=165(y1), r7=435(x2), r8=57(y2), r9=0x000000(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 31
LDI r1, 74
LDI r2, 117
LDI r3, 102
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
LDI r5, 10
LDI r6, 165
LDI r7, 435
LDI r8, 57
LDI r9, 0x000000
LINE r5, r6, r7, r8, r9
HALT
