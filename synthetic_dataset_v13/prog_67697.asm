; DESCRIPTION: Places a black 68x56 rectangle at position (167, 167).
; PLAN: r0=167(x), r1=167(y), r2=68(width), r3=56(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 167
LDI r1, 167
LDI r2, 68
LDI r3, 56
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
