; DESCRIPTION: Places a orange 56x25 rectangle at position (10, 223).
; PLAN: r0=10(x), r1=223(y), r2=56(width), r3=25(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 10
LDI r1, 223
LDI r2, 56
LDI r3, 25
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
