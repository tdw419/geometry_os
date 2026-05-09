; DESCRIPTION: Places a black 101x79 rectangle at position (352, 0).
; PLAN: r0=352(x), r1=0(y), r2=101(width), r3=79(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 352
LDI r1, 0
LDI r2, 101
LDI r3, 79
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
