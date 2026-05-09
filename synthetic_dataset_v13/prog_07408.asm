; DESCRIPTION: Places a cyan 83x29 rectangle at position (286, 77).
; PLAN: r0=286(x), r1=77(y), r2=83(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 286
LDI r1, 77
LDI r2, 83
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
