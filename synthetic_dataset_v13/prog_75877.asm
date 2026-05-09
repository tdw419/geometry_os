; DESCRIPTION: Composite: Places a yellow 73x74 rectangle at position (279, 21) then Draws a green line from (183, 33) to (55, 158) then Places a blue dot at position (405, 142).
; PLAN: r0=279(x), r1=21(y), r2=73(width), r3=74(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=183(x1), r6=33(y1), r7=55(x2), r8=158(y2), r9=0x00FF00(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=405(x), r11=142(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 279
LDI r1, 21
LDI r2, 73
LDI r3, 74
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 183
LDI r6, 33
LDI r7, 55
LDI r8, 158
LDI r9, 0x00FF00
LINE r5, r6, r7, r8, r9
LDI r10, 405
LDI r11, 142
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
