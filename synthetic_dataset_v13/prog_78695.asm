; DESCRIPTION: Places a orange 24x38 rectangle at position (462, 18).
; PLAN: r0=462(x), r1=18(y), r2=24(width), r3=38(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 18
LDI r2, 24
LDI r3, 38
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
