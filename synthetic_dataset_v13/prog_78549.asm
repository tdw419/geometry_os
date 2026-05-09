; DESCRIPTION: Renders a black box of size 82x47 starting at (59, 136).
; PLAN: r0=59(x), r1=136(y), r2=82(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 136
LDI r2, 82
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
