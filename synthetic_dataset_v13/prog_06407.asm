; DESCRIPTION: Places a cyan 35x119 rectangle at position (209, 137).
; PLAN: r0=209(x), r1=137(y), r2=35(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 137
LDI r2, 35
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
