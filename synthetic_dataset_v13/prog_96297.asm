; DESCRIPTION: Places a orange 39x89 rectangle at position (7, 20).
; PLAN: r0=7(x), r1=20(y), r2=39(width), r3=89(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 7
LDI r1, 20
LDI r2, 39
LDI r3, 89
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
