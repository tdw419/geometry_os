; DESCRIPTION: Places a cyan 107x38 rectangle at position (55, 58).
; PLAN: r0=55(x), r1=58(y), r2=107(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 55
LDI r1, 58
LDI r2, 107
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
