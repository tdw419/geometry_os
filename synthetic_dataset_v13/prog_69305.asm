; DESCRIPTION: Places a orange 71x32 rectangle at position (250, 12).
; PLAN: r0=250(x), r1=12(y), r2=71(width), r3=32(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 250
LDI r1, 12
LDI r2, 71
LDI r3, 32
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
