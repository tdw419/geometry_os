; DESCRIPTION: Renders a black box of size 48x103 starting at (241, 48).
; PLAN: r0=241(x), r1=48(y), r2=48(width), r3=103(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 241
LDI r1, 48
LDI r2, 48
LDI r3, 103
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
