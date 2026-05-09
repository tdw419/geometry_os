; DESCRIPTION: Places a red 77x99 rectangle at position (295, 78).
; PLAN: r0=295(x), r1=78(y), r2=77(width), r3=99(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 78
LDI r2, 77
LDI r3, 99
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
