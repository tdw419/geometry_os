; DESCRIPTION: Places a orange 52x115 rectangle at position (302, 75).
; PLAN: r0=302(x), r1=75(y), r2=52(width), r3=115(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 302
LDI r1, 75
LDI r2, 52
LDI r3, 115
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
