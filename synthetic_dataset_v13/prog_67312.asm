; DESCRIPTION: Renders a black box of size 120x73 starting at (59, 34).
; PLAN: r0=59(x), r1=34(y), r2=120(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 59
LDI r1, 34
LDI r2, 120
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
