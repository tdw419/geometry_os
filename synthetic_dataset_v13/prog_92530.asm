; DESCRIPTION: Places a black 14x38 rectangle at position (231, 65).
; PLAN: r0=231(x), r1=65(y), r2=14(width), r3=38(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 231
LDI r1, 65
LDI r2, 14
LDI r3, 38
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
