; DESCRIPTION: Places a cyan 119x119 rectangle at position (218, 41).
; PLAN: r0=218(x), r1=41(y), r2=119(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 218
LDI r1, 41
LDI r2, 119
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
