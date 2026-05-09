; DESCRIPTION: Composite: Renders a blue line between points (320, 56) and (126, 167) then Places a black 58x25 rectangle at position (41, 119).
; PLAN: r0=320(x1), r1=56(y1), r2=126(x2), r3=167(y2), r4=0x0000FF(color). Op: LINE r0, r1, r2, r3, r4 Next: r5=41(x), r6=119(y), r7=58(width), r8=25(height), r9=0x000000(color). Op: RECTF r5, r6, r7, r8, r9.
LDI r0, 320
LDI r1, 56
LDI r2, 126
LDI r3, 167
LDI r4, 0x0000FF
LINE r0, r1, r2, r3, r4
LDI r5, 41
LDI r6, 119
LDI r7, 58
LDI r8, 25
LDI r9, 0x000000
RECTF r5, r6, r7, r8, r9
HALT
