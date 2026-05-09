; DESCRIPTION: Places a orange 39x68 rectangle at position (77, 79).
; PLAN: r0=77(x), r1=79(y), r2=39(width), r3=68(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 79
LDI r2, 39
LDI r3, 68
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
