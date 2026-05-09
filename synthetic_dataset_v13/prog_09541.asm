; DESCRIPTION: Places a red 77x63 rectangle at position (79, 139).
; PLAN: r0=79(x), r1=139(y), r2=77(width), r3=63(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 139
LDI r2, 77
LDI r3, 63
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
