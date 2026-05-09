; DESCRIPTION: Places a cyan 43x97 rectangle at position (285, 41).
; PLAN: r0=285(x), r1=41(y), r2=43(width), r3=97(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 41
LDI r2, 43
LDI r3, 97
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
