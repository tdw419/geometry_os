; DESCRIPTION: Places a black 55x32 rectangle at position (252, 117).
; PLAN: r0=252(x), r1=117(y), r2=55(width), r3=32(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 117
LDI r2, 55
LDI r3, 32
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
