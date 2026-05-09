; DESCRIPTION: Places a red 22x25 rectangle at position (78, 18).
; PLAN: r0=78(x), r1=18(y), r2=22(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 78
LDI r1, 18
LDI r2, 22
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
