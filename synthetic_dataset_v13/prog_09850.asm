; DESCRIPTION: Places a cyan 13x119 rectangle at position (271, 84).
; PLAN: r0=271(x), r1=84(y), r2=13(width), r3=119(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 84
LDI r2, 13
LDI r3, 119
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
