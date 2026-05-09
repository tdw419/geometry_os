; DESCRIPTION: Renders a yellow box of size 113x71 starting at (265, 8).
; PLAN: r0=265(x), r1=8(y), r2=113(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 8
LDI r2, 113
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
