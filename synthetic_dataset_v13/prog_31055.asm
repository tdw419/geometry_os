; DESCRIPTION: Places a cyan 43x49 rectangle at position (354, 94).
; PLAN: r0=354(x), r1=94(y), r2=43(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 354
LDI r1, 94
LDI r2, 43
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
