; DESCRIPTION: Places a cyan 88x40 rectangle at position (47, 137).
; PLAN: r0=47(x), r1=137(y), r2=88(width), r3=40(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 47
LDI r1, 137
LDI r2, 88
LDI r3, 40
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
