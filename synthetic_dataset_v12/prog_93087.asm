; DESCRIPTION: Places a black 82x47 rectangle at position (22, 167).
; PLAN: r0=22(x), r1=167(y), r2=82(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 167
LDI r2, 82
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
