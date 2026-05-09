; DESCRIPTION: Places a orange 84x78 rectangle at position (346, 150).
; PLAN: r0=346(x), r1=150(y), r2=84(width), r3=78(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 150
LDI r2, 84
LDI r3, 78
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
