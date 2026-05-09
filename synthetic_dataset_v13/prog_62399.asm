; DESCRIPTION: Places a orange 97x112 rectangle at position (346, 90).
; PLAN: r0=346(x), r1=90(y), r2=97(width), r3=112(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 90
LDI r2, 97
LDI r3, 112
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
