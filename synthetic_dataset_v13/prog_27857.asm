; DESCRIPTION: Places a orange 91x39 rectangle at position (313, 114).
; PLAN: r0=313(x), r1=114(y), r2=91(width), r3=39(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 313
LDI r1, 114
LDI r2, 91
LDI r3, 39
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
