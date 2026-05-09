; DESCRIPTION: Places a orange 17x17 rectangle at position (485, 200).
; PLAN: r0=485(x), r1=200(y), r2=17(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 200
LDI r2, 17
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
