; DESCRIPTION: Places a black 79x26 rectangle at position (68, 172).
; PLAN: r0=68(x), r1=172(y), r2=79(width), r3=26(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 68
LDI r1, 172
LDI r2, 79
LDI r3, 26
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
