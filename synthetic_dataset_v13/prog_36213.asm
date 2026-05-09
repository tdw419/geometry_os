; DESCRIPTION: Renders a yellow box of size 113x69 starting at (215, 19).
; PLAN: r0=215(x), r1=19(y), r2=113(width), r3=69(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 19
LDI r2, 113
LDI r3, 69
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
