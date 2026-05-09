; DESCRIPTION: Composite: Renders a orange line between points (180, 55) and (449, 126) then Places a magenta 59x84 rectangle at position (161, 22).
; PLAN: r0=180(x1), r1=55(y1), r2=449(x2), r3=126(y2), r4=0xFF8800(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=161(x), r6=22(y), r7=59(width), r8=84(height), r9=0xFF00FF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 180
LDI r1, 55
LDI r2, 449
LDI r3, 126
LDI r4, 0xFF8800
LINE r0, r1, r2, r3, r4
LDI r5, 161
LDI r6, 22
LDI r7, 59
LDI r8, 84
LDI r9, 0xFF00FF
RECTF r5, r6, r7, r8, r9
HALT
