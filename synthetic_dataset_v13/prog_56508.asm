; DESCRIPTION: Places a black 39x76 rectangle at position (167, 71).
; PLAN: r0=167(x), r1=71(y), r2=39(width), r3=76(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 71
LDI r2, 39
LDI r3, 76
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
