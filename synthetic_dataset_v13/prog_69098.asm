; DESCRIPTION: Places a orange 50x55 rectangle at position (178, 43).
; PLAN: r0=178(x), r1=43(y), r2=50(width), r3=55(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 178
LDI r1, 43
LDI r2, 50
LDI r3, 55
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
