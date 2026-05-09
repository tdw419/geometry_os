; DESCRIPTION: Places a orange 94x58 rectangle at position (213, 132).
; PLAN: r0=213(x), r1=132(y), r2=94(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 213
LDI r1, 132
LDI r2, 94
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
