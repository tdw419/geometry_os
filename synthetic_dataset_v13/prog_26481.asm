; DESCRIPTION: Composite: Places a cyan 72x52 rectangle at position (310, 89) then Renders a blue line between points (184, 5) and (475, 12).
; PLAN: r0=310(x), r1=89(y), r2=72(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=184(x1), r6=5(y1), r7=475(x2), r8=12(y2), r9=0x0000FF(color). Op: LINE r5, r6, r7, r8, r9.
LDI r0, 310
LDI r1, 89
LDI r2, 72
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
LDI r5, 184
LDI r6, 5
LDI r7, 475
LDI r8, 12
LDI r9, 0x0000FF
LINE r5, r6, r7, r8, r9
HALT
