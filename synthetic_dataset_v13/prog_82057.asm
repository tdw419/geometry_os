; DESCRIPTION: Places a orange 56x61 rectangle at position (210, 20).
; PLAN: r0=210(x), r1=20(y), r2=56(width), r3=61(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 20
LDI r2, 56
LDI r3, 61
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
