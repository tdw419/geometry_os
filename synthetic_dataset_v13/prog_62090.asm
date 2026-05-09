; DESCRIPTION: Places a orange 58x48 rectangle at position (105, 96).
; PLAN: r0=105(x), r1=96(y), r2=58(width), r3=48(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 96
LDI r2, 58
LDI r3, 48
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
