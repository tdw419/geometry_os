; DESCRIPTION: Renders a yellow box of size 24x34 starting at (488, 173).
; PLAN: r0=488(x), r1=173(y), r2=24(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 173
LDI r2, 24
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
