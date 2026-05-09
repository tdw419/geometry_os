; DESCRIPTION: Renders a black box of size 61x17 starting at (196, 168).
; PLAN: r0=196(x), r1=168(y), r2=61(width), r3=17(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 168
LDI r2, 61
LDI r3, 17
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
