; DESCRIPTION: Places a orange 86x44 rectangle at position (38, 83).
; PLAN: r0=38(x), r1=83(y), r2=86(width), r3=44(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 38
LDI r1, 83
LDI r2, 86
LDI r3, 44
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
