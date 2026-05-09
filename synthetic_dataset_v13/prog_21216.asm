; DESCRIPTION: Composite: Places a red 18x105 rectangle at position (243, 148) then Renders a purple line between points (392, 208) and (69, 5) then Places a blue dot at position (167, 166).
; PLAN: r0=243(x), r1=148(y), r2=18(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=392(x1), r6=208(y1), r7=69(x2), r8=5(y2), r9=0xAA00FF(color). Op: LINE r5, r6, r7, r8, r9 Next: r10=167(x), r11=166(y), r12=0x0000FF(color). Op: PSET r10, r11, r12.
LDI r0, 243
LDI r1, 148
LDI r2, 18
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
LDI r5, 392
LDI r6, 208
LDI r7, 69
LDI r8, 5
LDI r9, 0xAA00FF
LINE r5, r6, r7, r8, r9
LDI r10, 167
LDI r11, 166
LDI r12, 0x0000FF
PSET r10, r11, r12
HALT
