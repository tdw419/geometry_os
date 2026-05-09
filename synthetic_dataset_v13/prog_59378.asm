; DESCRIPTION: Places a cyan 29x73 rectangle at position (306, 45).
; PLAN: r0=306(x), r1=45(y), r2=29(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 45
LDI r2, 29
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
