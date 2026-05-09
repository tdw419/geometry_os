; DESCRIPTION: Places a orange 11x80 rectangle at position (306, 135).
; PLAN: r0=306(x), r1=135(y), r2=11(width), r3=80(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 135
LDI r2, 11
LDI r3, 80
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
