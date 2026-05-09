; DESCRIPTION: Places a orange 105x27 rectangle at position (372, 159).
; PLAN: r0=372(x), r1=159(y), r2=105(width), r3=27(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 372
LDI r1, 159
LDI r2, 105
LDI r3, 27
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
