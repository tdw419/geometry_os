; DESCRIPTION: Places a cyan 88x96 rectangle at position (77, 130).
; PLAN: r0=77(x), r1=130(y), r2=88(width), r3=96(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 130
LDI r2, 88
LDI r3, 96
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
