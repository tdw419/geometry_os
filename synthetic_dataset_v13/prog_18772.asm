; DESCRIPTION: Places a cyan 43x16 rectangle at position (26, 210).
; PLAN: r0=26(x), r1=210(y), r2=43(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 26
LDI r1, 210
LDI r2, 43
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
