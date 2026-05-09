; DESCRIPTION: Places a black 27x53 rectangle at position (173, 75).
; PLAN: r0=173(x), r1=75(y), r2=27(width), r3=53(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 173
LDI r1, 75
LDI r2, 27
LDI r3, 53
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
