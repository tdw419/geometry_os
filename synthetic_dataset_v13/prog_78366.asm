; DESCRIPTION: Places a red 71x44 rectangle at position (22, 34).
; PLAN: r0=22(x), r1=34(y), r2=71(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 22
LDI r1, 34
LDI r2, 71
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
