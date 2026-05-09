; DESCRIPTION: Places a cyan 102x97 rectangle at position (271, 122).
; PLAN: r0=271(x), r1=122(y), r2=102(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 122
LDI r2, 102
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
