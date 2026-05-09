; DESCRIPTION: Places a orange 46x76 rectangle at position (372, 105).
; PLAN: r0=372(x), r1=105(y), r2=46(width), r3=76(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 105
LDI r2, 46
LDI r3, 76
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
