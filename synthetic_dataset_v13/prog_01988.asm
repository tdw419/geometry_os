; DESCRIPTION: Places a red 22x61 rectangle at position (432, 46).
; PLAN: r0=432(x), r1=46(y), r2=22(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 432
LDI r1, 46
LDI r2, 22
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
