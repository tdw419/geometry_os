; DESCRIPTION: Places a cyan 66x95 rectangle at position (122, 112).
; PLAN: r0=122(x), r1=112(y), r2=66(width), r3=95(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 122
LDI r1, 112
LDI r2, 66
LDI r3, 95
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
