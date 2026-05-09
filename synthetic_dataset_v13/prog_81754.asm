; DESCRIPTION: Places a black 71x65 rectangle at position (380, 88).
; PLAN: r0=380(x), r1=88(y), r2=71(width), r3=65(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 88
LDI r2, 71
LDI r3, 65
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
