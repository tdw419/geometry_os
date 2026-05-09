; DESCRIPTION: Places a orange 22x109 rectangle at position (485, 91).
; PLAN: r0=485(x), r1=91(y), r2=22(width), r3=109(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 485
LDI r1, 91
LDI r2, 22
LDI r3, 109
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
