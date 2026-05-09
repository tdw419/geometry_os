; DESCRIPTION: Draws a green rectangle at (317, 120) with width 58 and height 50.
; PLAN: r0=317(x), r1=120(y), r2=58(width), r3=50(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 120
LDI r2, 58
LDI r3, 50
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
