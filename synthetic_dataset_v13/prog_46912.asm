; DESCRIPTION: Draws a blue rectangle at (443, 119) with width 16 and height 10.
; PLAN: r0=443(x), r1=119(y), r2=16(width), r3=10(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 119
LDI r2, 16
LDI r3, 10
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
