; DESCRIPTION: Places a orange 95x77 rectangle at position (162, 75).
; PLAN: r0=162(x), r1=75(y), r2=95(width), r3=77(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 75
LDI r2, 95
LDI r3, 77
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
