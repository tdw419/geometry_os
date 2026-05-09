; DESCRIPTION: Places a orange 27x67 rectangle at position (270, 132).
; PLAN: r0=270(x), r1=132(y), r2=27(width), r3=67(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 270
LDI r1, 132
LDI r2, 27
LDI r3, 67
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
