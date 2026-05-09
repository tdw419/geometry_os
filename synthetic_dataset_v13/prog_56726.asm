; DESCRIPTION: Renders a yellow box of size 45x75 starting at (50, 141).
; PLAN: r0=50(x), r1=141(y), r2=45(width), r3=75(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 50
LDI r1, 141
LDI r2, 45
LDI r3, 75
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
