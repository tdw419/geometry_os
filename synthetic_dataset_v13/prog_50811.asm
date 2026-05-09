; DESCRIPTION: Places a cyan 63x71 rectangle at position (26, 176).
; PLAN: r0=26(x), r1=176(y), r2=63(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 176
LDI r2, 63
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
