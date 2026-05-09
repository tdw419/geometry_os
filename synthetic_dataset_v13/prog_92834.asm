; DESCRIPTION: Places a cyan 82x119 rectangle at position (255, 56).
; PLAN: r0=255(x), r1=56(y), r2=82(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 255
LDI r1, 56
LDI r2, 82
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
