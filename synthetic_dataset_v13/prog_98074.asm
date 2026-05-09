; DESCRIPTION: Places a orange 44x113 rectangle at position (345, 24).
; PLAN: r0=345(x), r1=24(y), r2=44(width), r3=113(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 345
LDI r1, 24
LDI r2, 44
LDI r3, 113
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
