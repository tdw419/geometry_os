; DESCRIPTION: Renders a black box of size 24x11 starting at (229, 103).
; PLAN: r0=229(x), r1=103(y), r2=24(width), r3=11(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 229
LDI r1, 103
LDI r2, 24
LDI r3, 11
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
