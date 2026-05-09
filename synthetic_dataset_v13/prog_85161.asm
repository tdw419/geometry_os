; DESCRIPTION: Places a orange 21x16 rectangle at position (252, 210).
; PLAN: r0=252(x), r1=210(y), r2=21(width), r3=16(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 210
LDI r2, 21
LDI r3, 16
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
