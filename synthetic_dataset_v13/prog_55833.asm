; DESCRIPTION: Places a cyan 18x76 rectangle at position (108, 66).
; PLAN: r0=108(x), r1=66(y), r2=18(width), r3=76(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 108
LDI r1, 66
LDI r2, 18
LDI r3, 76
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
