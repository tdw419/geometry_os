; DESCRIPTION: Places a orange 33x107 rectangle at position (165, 55).
; PLAN: r0=165(x), r1=55(y), r2=33(width), r3=107(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 165
LDI r1, 55
LDI r2, 33
LDI r3, 107
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
