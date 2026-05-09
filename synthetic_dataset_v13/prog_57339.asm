; DESCRIPTION: Places a cyan 108x35 rectangle at position (159, 31).
; PLAN: r0=159(x), r1=31(y), r2=108(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 31
LDI r2, 108
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
