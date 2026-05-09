; DESCRIPTION: Renders a yellow box of size 55x78 starting at (173, 68).
; PLAN: r0=173(x), r1=68(y), r2=55(width), r3=78(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 68
LDI r2, 55
LDI r3, 78
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
