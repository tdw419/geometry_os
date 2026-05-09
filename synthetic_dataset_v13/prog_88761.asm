; DESCRIPTION: Places a orange 37x80 rectangle at position (73, 80).
; PLAN: r0=73(x), r1=80(y), r2=37(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 73
LDI r1, 80
LDI r2, 37
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
