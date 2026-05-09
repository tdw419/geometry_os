; DESCRIPTION: Renders a yellow box of size 62x85 starting at (173, 171).
; PLAN: r0=173(x), r1=171(y), r2=62(width), r3=85(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 171
LDI r2, 62
LDI r3, 85
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
