; DESCRIPTION: Places a cyan 83x21 rectangle at position (76, 232).
; PLAN: r0=76(x), r1=232(y), r2=83(width), r3=21(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 76
LDI r1, 232
LDI r2, 83
LDI r3, 21
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
