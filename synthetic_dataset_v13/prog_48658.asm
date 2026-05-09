; DESCRIPTION: Places a cyan 88x13 rectangle at position (398, 19).
; PLAN: r0=398(x), r1=19(y), r2=88(width), r3=13(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 398
LDI r1, 19
LDI r2, 88
LDI r3, 13
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
