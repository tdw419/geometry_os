; DESCRIPTION: Places a orange 19x91 rectangle at position (386, 61).
; PLAN: r0=386(x), r1=61(y), r2=19(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 61
LDI r2, 19
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
