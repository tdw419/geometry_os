; DESCRIPTION: Places a orange 82x90 rectangle at position (96, 23).
; PLAN: r0=96(x), r1=23(y), r2=82(width), r3=90(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 96
LDI r1, 23
LDI r2, 82
LDI r3, 90
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
