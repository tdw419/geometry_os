; DESCRIPTION: Places a orange 45x65 rectangle at position (174, 88).
; PLAN: r0=174(x), r1=88(y), r2=45(width), r3=65(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 88
LDI r2, 45
LDI r3, 65
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
