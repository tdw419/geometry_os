; DESCRIPTION: Places a red 44x92 rectangle at position (78, 5).
; PLAN: r0=78(x), r1=5(y), r2=44(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 5
LDI r2, 44
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
