; DESCRIPTION: Places a orange 97x79 rectangle at position (332, 127).
; PLAN: r0=332(x), r1=127(y), r2=97(width), r3=79(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 332
LDI r1, 127
LDI r2, 97
LDI r3, 79
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
