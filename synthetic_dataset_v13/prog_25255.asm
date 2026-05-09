; DESCRIPTION: Places a black 35x34 rectangle at position (368, 30).
; PLAN: r0=368(x), r1=30(y), r2=35(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 30
LDI r2, 35
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
