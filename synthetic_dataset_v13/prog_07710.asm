; DESCRIPTION: Places a orange 24x75 rectangle at position (405, 172).
; PLAN: r0=405(x), r1=172(y), r2=24(width), r3=75(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 172
LDI r2, 24
LDI r3, 75
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
