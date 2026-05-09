; DESCRIPTION: Places a orange 54x48 rectangle at position (61, 13).
; PLAN: r0=61(x), r1=13(y), r2=54(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 61
LDI r1, 13
LDI r2, 54
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
