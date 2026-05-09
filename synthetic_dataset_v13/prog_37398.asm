; DESCRIPTION: Places a orange 102x20 rectangle at position (124, 170).
; PLAN: r0=124(x), r1=170(y), r2=102(width), r3=20(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 124
LDI r1, 170
LDI r2, 102
LDI r3, 20
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
