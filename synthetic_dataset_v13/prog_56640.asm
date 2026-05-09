; DESCRIPTION: Places a black 34x36 rectangle at position (301, 22).
; PLAN: r0=301(x), r1=22(y), r2=34(width), r3=36(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 301
LDI r1, 22
LDI r2, 34
LDI r3, 36
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
