; DESCRIPTION: Renders a black box of size 108x63 starting at (134, 164).
; PLAN: r0=134(x), r1=164(y), r2=108(width), r3=63(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 134
LDI r1, 164
LDI r2, 108
LDI r3, 63
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
