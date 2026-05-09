; DESCRIPTION: Renders a yellow box of size 103x82 starting at (130, 167).
; PLAN: r0=130(x), r1=167(y), r2=103(width), r3=82(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 167
LDI r2, 103
LDI r3, 82
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
