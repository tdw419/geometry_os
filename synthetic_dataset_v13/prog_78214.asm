; DESCRIPTION: Places a orange 102x50 rectangle at position (80, 115).
; PLAN: r0=80(x), r1=115(y), r2=102(width), r3=50(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 115
LDI r2, 102
LDI r3, 50
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
