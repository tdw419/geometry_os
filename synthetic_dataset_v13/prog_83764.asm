; DESCRIPTION: Places a green 83x14 rectangle at position (251, 37).
; PLAN: r0=251(x), r1=37(y), r2=83(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 251
LDI r1, 37
LDI r2, 83
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
