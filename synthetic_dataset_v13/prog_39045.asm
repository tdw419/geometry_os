; DESCRIPTION: Places a black 103x72 rectangle at position (79, 5).
; PLAN: r0=79(x), r1=5(y), r2=103(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 5
LDI r2, 103
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
