; DESCRIPTION: Places a orange 78x25 rectangle at position (243, 43).
; PLAN: r0=243(x), r1=43(y), r2=78(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 43
LDI r2, 78
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
