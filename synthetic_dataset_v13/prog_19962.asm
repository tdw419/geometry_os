; DESCRIPTION: Renders a yellow box of size 103x71 starting at (98, 34).
; PLAN: r0=98(x), r1=34(y), r2=103(width), r3=71(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 98
LDI r1, 34
LDI r2, 103
LDI r3, 71
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
