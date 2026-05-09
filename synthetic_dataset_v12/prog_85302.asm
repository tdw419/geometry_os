; DESCRIPTION: Places a black 97x47 rectangle at position (362, 56).
; PLAN: r0=362(x), r1=56(y), r2=97(width), r3=47(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 56
LDI r2, 97
LDI r3, 47
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
