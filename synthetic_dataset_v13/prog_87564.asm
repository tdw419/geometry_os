; DESCRIPTION: Places a cyan 40x62 rectangle at position (15, 4).
; PLAN: r0=15(x), r1=4(y), r2=40(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 15
LDI r1, 4
LDI r2, 40
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
