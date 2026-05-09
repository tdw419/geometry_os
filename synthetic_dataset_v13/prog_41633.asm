; DESCRIPTION: Places a orange 75x114 rectangle at position (305, 132).
; PLAN: r0=305(x), r1=132(y), r2=75(width), r3=114(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 132
LDI r2, 75
LDI r3, 114
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
