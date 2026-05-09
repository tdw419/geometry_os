; DESCRIPTION: Places a black 50x61 rectangle at position (234, 113).
; PLAN: r0=234(x), r1=113(y), r2=50(width), r3=61(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 113
LDI r2, 50
LDI r3, 61
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
