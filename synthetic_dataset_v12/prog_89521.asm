; DESCRIPTION: Places a black 73x39 rectangle at position (81, 124).
; PLAN: r0=81(x), r1=124(y), r2=73(width), r3=39(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 81
LDI r1, 124
LDI r2, 73
LDI r3, 39
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
