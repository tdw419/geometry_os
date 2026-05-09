; DESCRIPTION: Composite: Draws a blue line from (55, 10) to (449, 174) then Draws a cyan rectangle at (265, 56) with width 42 and height 120.
; PLAN: r0=55(x1), r1=10(y1), r2=449(x2), r3=174(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=265(x), r6=56(y), r7=42(width), r8=120(height), r9=0x00FFFF(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 55
LDI r1, 10
LDI r2, 449
LDI r3, 174
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 265
LDI r6, 56
LDI r7, 42
LDI r8, 120
LDI r9, 0x00FFFF
RECTF r5, r6, r7, r8, r9
HALT
