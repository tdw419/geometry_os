; DESCRIPTION: Places a orange 39x89 rectangle at position (442, 55).
; PLAN: r0=442(x), r1=55(y), r2=39(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 442
LDI r1, 55
LDI r2, 39
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
