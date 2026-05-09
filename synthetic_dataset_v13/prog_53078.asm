; DESCRIPTION: Places a orange 96x12 rectangle at position (259, 71).
; PLAN: r0=259(x), r1=71(y), r2=96(width), r3=12(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 71
LDI r2, 96
LDI r3, 12
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
