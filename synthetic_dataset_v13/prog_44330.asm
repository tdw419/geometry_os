; DESCRIPTION: Places a black 34x37 rectangle at position (208, 166).
; PLAN: r0=208(x), r1=166(y), r2=34(width), r3=37(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 166
LDI r2, 34
LDI r3, 37
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
