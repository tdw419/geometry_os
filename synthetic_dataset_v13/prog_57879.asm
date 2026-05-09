; DESCRIPTION: Places a cyan 41x108 rectangle at position (455, 116).
; PLAN: r0=455(x), r1=116(y), r2=41(width), r3=108(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 455
LDI r1, 116
LDI r2, 41
LDI r3, 108
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
