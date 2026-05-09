; DESCRIPTION: Composite: Draws a red rectangle at (205, 215) with width 117 and height 16 then Renders a red line between points (105, 168) and (349, 162) then Places a blue dot at position (452, 61).
; PLAN: r0=205(x), r1=215(y), r2=117(width), r3=16(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=105(x1), r6=168(y1), r7=349(x2), r8=162(y2), r9=0xFF0000(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=452(x), r11=61(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 205
LDI r1, 215
LDI r2, 117
LDI r3, 16
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 105
LDI r6, 168
LDI r7, 349
LDI r8, 162
LDI r9, 0xFF0000
LINE r5, r6, r7, r8, r9
LDI r10, 452
LDI r11, 61
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
