; DESCRIPTION: Places a orange 11x91 rectangle at position (108, 48).
; PLAN: r0=108(x), r1=48(y), r2=11(width), r3=91(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 48
LDI r2, 11
LDI r3, 91
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
