; DESCRIPTION: Places a orange 74x99 rectangle at position (45, 96).
; PLAN: r0=45(x), r1=96(y), r2=74(width), r3=99(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 96
LDI r2, 74
LDI r3, 99
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
