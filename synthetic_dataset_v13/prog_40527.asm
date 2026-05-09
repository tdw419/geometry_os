; DESCRIPTION: Places a cyan 84x63 rectangle at position (259, 41).
; PLAN: r0=259(x), r1=41(y), r2=84(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 41
LDI r2, 84
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
