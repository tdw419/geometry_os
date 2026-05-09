; DESCRIPTION: Places a green 41x84 rectangle at position (195, 27).
; PLAN: r0=195(x), r1=27(y), r2=41(width), r3=84(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 195
LDI r1, 27
LDI r2, 41
LDI r3, 84
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
