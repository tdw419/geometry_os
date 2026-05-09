; DESCRIPTION: Places a black 55x55 rectangle at position (114, 19).
; PLAN: r0=114(x), r1=19(y), r2=55(width), r3=55(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 114
LDI r1, 19
LDI r2, 55
LDI r3, 55
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
