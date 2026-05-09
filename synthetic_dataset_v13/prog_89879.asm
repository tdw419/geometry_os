; DESCRIPTION: Places a cyan 19x119 rectangle at position (479, 108).
; PLAN: r0=479(x), r1=108(y), r2=19(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 479
LDI r1, 108
LDI r2, 19
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
