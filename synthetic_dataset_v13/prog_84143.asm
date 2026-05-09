; DESCRIPTION: Renders a yellow box of size 112x24 starting at (183, 173).
; PLAN: r0=183(x), r1=173(y), r2=112(width), r3=24(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 183
LDI r1, 173
LDI r2, 112
LDI r3, 24
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
