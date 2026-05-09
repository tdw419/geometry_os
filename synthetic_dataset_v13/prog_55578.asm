; DESCRIPTION: Renders a yellow box of size 103x71 starting at (172, 114).
; PLAN: r0=172(x), r1=114(y), r2=103(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 172
LDI r1, 114
LDI r2, 103
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
