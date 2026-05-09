; DESCRIPTION: Places a black 68x10 rectangle at position (173, 170).
; PLAN: r0=173(x), r1=170(y), r2=68(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 170
LDI r2, 68
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
