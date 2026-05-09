; DESCRIPTION: Places a orange 23x22 rectangle at position (386, 83).
; PLAN: r0=386(x), r1=83(y), r2=23(width), r3=22(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 83
LDI r2, 23
LDI r3, 22
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
