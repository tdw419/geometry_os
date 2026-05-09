; DESCRIPTION: Places a orange 108x27 rectangle at position (358, 136).
; PLAN: r0=358(x), r1=136(y), r2=108(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 358
LDI r1, 136
LDI r2, 108
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
