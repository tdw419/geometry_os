; DESCRIPTION: Places a black 14x34 rectangle at position (485, 141).
; PLAN: r0=485(x), r1=141(y), r2=14(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 141
LDI r2, 14
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
