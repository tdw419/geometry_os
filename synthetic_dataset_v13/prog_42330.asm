; DESCRIPTION: Places a cyan 95x78 rectangle at position (355, 53).
; PLAN: r0=355(x), r1=53(y), r2=95(width), r3=78(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 355
LDI r1, 53
LDI r2, 95
LDI r3, 78
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
