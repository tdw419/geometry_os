; DESCRIPTION: Renders a black box of size 120x120 starting at (83, 108).
; PLAN: r0=83(x), r1=108(y), r2=120(width), r3=120(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 83
LDI r1, 108
LDI r2, 120
LDI r3, 120
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
