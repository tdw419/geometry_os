; DESCRIPTION: Places a orange 54x43 rectangle at position (268, 25).
; PLAN: r0=268(x), r1=25(y), r2=54(width), r3=43(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 268
LDI r1, 25
LDI r2, 54
LDI r3, 43
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
