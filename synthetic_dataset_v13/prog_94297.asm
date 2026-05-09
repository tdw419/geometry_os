; DESCRIPTION: Composite: Renders a white line between points (419, 207) and (354, 208) then Draws a red rectangle at (35, 48) with width 35 and height 43.
; PLAN: r0=419(x1), r1=207(y1), r2=354(x2), r3=208(y2), r4=0xFFFFFF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=35(x), r6=48(y), r7=35(width), r8=43(height), r9=0xFF0000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 419
LDI r1, 207
LDI r2, 354
LDI r3, 208
LDI r4, 0xFFFFFF
LINE r0, r1, r2, r3, r4
LDI r5, 35
LDI r6, 48
LDI r7, 35
LDI r8, 43
LDI r9, 0xFF0000
RECTF r5, r6, r7, r8, r9
HALT
