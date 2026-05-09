; DESCRIPTION: Places a cyan 15x13 rectangle at position (492, 141).
; PLAN: r0=492(x), r1=141(y), r2=15(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 492
LDI r1, 141
LDI r2, 15
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
