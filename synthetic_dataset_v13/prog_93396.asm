; DESCRIPTION: Places a orange 72x94 rectangle at position (56, 132).
; PLAN: r0=56(x), r1=132(y), r2=72(width), r3=94(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 56
LDI r1, 132
LDI r2, 72
LDI r3, 94
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
