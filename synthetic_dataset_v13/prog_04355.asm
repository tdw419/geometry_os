; DESCRIPTION: Places a orange 95x84 rectangle at position (72, 160).
; PLAN: r0=72(x), r1=160(y), r2=95(width), r3=84(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 72
LDI r1, 160
LDI r2, 95
LDI r3, 84
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
