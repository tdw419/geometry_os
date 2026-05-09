; DESCRIPTION: Places a red 11x77 rectangle at position (366, 169).
; PLAN: r0=366(x), r1=169(y), r2=11(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 366
LDI r1, 169
LDI r2, 11
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
