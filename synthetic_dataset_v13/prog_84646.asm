; DESCRIPTION: Places a orange 95x66 rectangle at position (318, 48).
; PLAN: r0=318(x), r1=48(y), r2=95(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 318
LDI r1, 48
LDI r2, 95
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
