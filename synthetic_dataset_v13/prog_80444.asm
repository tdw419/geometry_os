; DESCRIPTION: Places a red 110x23 rectangle at position (128, 127).
; PLAN: r0=128(x), r1=127(y), r2=110(width), r3=23(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 128
LDI r1, 127
LDI r2, 110
LDI r3, 23
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
