; DESCRIPTION: Renders a yellow box of size 105x70 starting at (120, 50).
; PLAN: r0=120(x), r1=50(y), r2=105(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 120
LDI r1, 50
LDI r2, 105
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
