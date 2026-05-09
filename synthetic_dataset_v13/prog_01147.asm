; DESCRIPTION: Renders a black box of size 72x85 starting at (311, 32).
; PLAN: r0=311(x), r1=32(y), r2=72(width), r3=85(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 32
LDI r2, 72
LDI r3, 85
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
