; DESCRIPTION: Places a orange 56x80 rectangle at position (160, 94).
; PLAN: r0=160(x), r1=94(y), r2=56(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 94
LDI r2, 56
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
