; DESCRIPTION: Places a cyan 62x70 rectangle at position (319, 116).
; PLAN: r0=319(x), r1=116(y), r2=62(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 116
LDI r2, 62
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
