; DESCRIPTION: Places a orange 44x39 rectangle at position (126, 210).
; PLAN: r0=126(x), r1=210(y), r2=44(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 126
LDI r1, 210
LDI r2, 44
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
