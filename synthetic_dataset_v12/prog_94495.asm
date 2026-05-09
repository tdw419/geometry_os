; DESCRIPTION: Renders a black box of size 71x61 starting at (346, 34).
; PLAN: r0=346(x), r1=34(y), r2=71(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 34
LDI r2, 71
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
