; DESCRIPTION: Places a black 69x27 rectangle at position (304, 164).
; PLAN: r0=304(x), r1=164(y), r2=69(width), r3=27(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 304
LDI r1, 164
LDI r2, 69
LDI r3, 27
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
