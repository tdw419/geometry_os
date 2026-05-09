; DESCRIPTION: Renders a yellow box of size 50x85 starting at (366, 165).
; PLAN: r0=366(x), r1=165(y), r2=50(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 165
LDI r2, 50
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
