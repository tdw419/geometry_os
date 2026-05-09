; DESCRIPTION: Places a orange 22x58 rectangle at position (465, 19).
; PLAN: r0=465(x), r1=19(y), r2=22(width), r3=58(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 465
LDI r1, 19
LDI r2, 22
LDI r3, 58
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
