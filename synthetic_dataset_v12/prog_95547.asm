; DESCRIPTION: Places a red 73x14 rectangle at position (332, 238).
; PLAN: r0=332(x), r1=238(y), r2=73(width), r3=14(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 238
LDI r2, 73
LDI r3, 14
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
