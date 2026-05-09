; DESCRIPTION: Places a red 78x46 rectangle at position (432, 2).
; PLAN: r0=432(x), r1=2(y), r2=78(width), r3=46(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 2
LDI r2, 78
LDI r3, 46
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
