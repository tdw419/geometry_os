; DESCRIPTION: Places a cyan 48x82 rectangle at position (339, 122).
; PLAN: r0=339(x), r1=122(y), r2=48(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 339
LDI r1, 122
LDI r2, 48
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
