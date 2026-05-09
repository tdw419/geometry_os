; DESCRIPTION: Places a white 83x14 rectangle at position (306, 49).
; PLAN: r0=306(x), r1=49(y), r2=83(width), r3=14(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 306
LDI r1, 49
LDI r2, 83
LDI r3, 14
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
