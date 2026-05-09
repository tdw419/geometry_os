; DESCRIPTION: Places a black 52x72 rectangle at position (150, 150).
; PLAN: r0=150(x), r1=150(y), r2=52(width), r3=72(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 150
LDI r1, 150
LDI r2, 52
LDI r3, 72
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
