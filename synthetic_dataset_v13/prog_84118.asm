; DESCRIPTION: Composite: Places a white 113x114 rectangle at position (69, 125) then Draws a orange line from (131, 24) to (206, 149) then Places a blue dot at position (488, 92).
; PLAN: r0=69(x), r1=125(y), r2=113(width), r3=114(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=131(x1), r6=24(y1), r7=206(x2), r8=149(y2), r9=0xFF8800(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=488(x), r11=92(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 69
LDI r1, 125
LDI r2, 113
LDI r3, 114
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 131
LDI r6, 24
LDI r7, 206
LDI r8, 149
LDI r9, 0xFF8800
LINE r5, r6, r7, r8, r9
LDI r10, 488
LDI r11, 92
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
