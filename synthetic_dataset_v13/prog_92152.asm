; DESCRIPTION: Places a yellow 58x22 rectangle at position (70, 161).
; PLAN: r0=70(x), r1=161(y), r2=58(width), r3=22(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 70
LDI r1, 161
LDI r2, 58
LDI r3, 22
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
