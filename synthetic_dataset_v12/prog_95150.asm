; DESCRIPTION: Places a orange 46x19 rectangle at position (393, 145).
; PLAN: r0=393(x), r1=145(y), r2=46(width), r3=19(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 145
LDI r2, 46
LDI r3, 19
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
