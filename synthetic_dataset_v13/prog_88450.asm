; DESCRIPTION: Places a orange 95x33 rectangle at position (290, 5).
; PLAN: r0=290(x), r1=5(y), r2=95(width), r3=33(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 5
LDI r2, 95
LDI r3, 33
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
