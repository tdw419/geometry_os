; DESCRIPTION: Places a orange 37x17 rectangle at position (10, 193).
; PLAN: r0=10(x), r1=193(y), r2=37(width), r3=17(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 193
LDI r2, 37
LDI r3, 17
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
