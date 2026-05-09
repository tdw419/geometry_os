; DESCRIPTION: Places a red 46x22 rectangle at position (13, 197).
; PLAN: r0=13(x), r1=197(y), r2=46(width), r3=22(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 197
LDI r2, 46
LDI r3, 22
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
