; DESCRIPTION: Places a yellow 73x34 rectangle at position (381, 71).
; PLAN: r0=381(x), r1=71(y), r2=73(width), r3=34(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 381
LDI r1, 71
LDI r2, 73
LDI r3, 34
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
