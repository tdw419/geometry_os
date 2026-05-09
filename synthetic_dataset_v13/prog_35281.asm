; DESCRIPTION: Composite: Places a red 102x35 rectangle at position (148, 52) then Draws a magenta line from (60, 158) to (241, 38) then Places a purple dot at position (256, 167).
; PLAN: r0=148(x), r1=52(y), r2=102(width), r3=35(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=60(x1), r6=158(y1), r7=241(x2), r8=38(y2), r9=0xFF00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=256(x), r11=167(y), r12=0xAA00FF(color). Op: PSET r10, r11, r12.
LDI r0, 148
LDI r1, 52
LDI r2, 102
LDI r3, 35
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 60
LDI r6, 158
LDI r7, 241
LDI r8, 38
LDI r9, 0xFF00FF
LINE r5, r6, r7, r8, r9
LDI r10, 256
LDI r11, 167
LDI r12, 0xAA00FF
PSET r10, r11, r12
HALT
