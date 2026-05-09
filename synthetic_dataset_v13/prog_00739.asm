; DESCRIPTION: Places a orange 71x82 rectangle at position (440, 96).
; PLAN: r0=440(x), r1=96(y), r2=71(width), r3=82(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 96
LDI r2, 71
LDI r3, 82
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
