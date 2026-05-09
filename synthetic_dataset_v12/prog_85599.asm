; DESCRIPTION: Places a cyan 11x26 rectangle at position (164, 27).
; PLAN: r0=164(x), r1=27(y), r2=11(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 164
LDI r1, 27
LDI r2, 11
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
