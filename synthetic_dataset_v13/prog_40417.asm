; DESCRIPTION: Renders a black box of size 92x60 starting at (254, 50).
; PLAN: r0=254(x), r1=50(y), r2=92(width), r3=60(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 50
LDI r2, 92
LDI r3, 60
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
