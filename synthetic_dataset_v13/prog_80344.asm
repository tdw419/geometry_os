; DESCRIPTION: Places a black 34x10 rectangle at position (380, 29).
; PLAN: r0=380(x), r1=29(y), r2=34(width), r3=10(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 380
LDI r1, 29
LDI r2, 34
LDI r3, 10
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
