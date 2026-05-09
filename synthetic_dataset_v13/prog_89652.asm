; DESCRIPTION: Composite: Places a red 92x17 rectangle at position (217, 179) then Renders a blue line between points (204, 45) and (334, 205).
; PLAN: r0=217(x), r1=179(y), r2=92(width), r3=17(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=204(x1), r6=45(y1), r7=334(x2), r8=205(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 217
LDI r1, 179
LDI r2, 92
LDI r3, 17
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 204
LDI r6, 45
LDI r7, 334
LDI r8, 205
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
