; DESCRIPTION: Places a green 24x83 rectangle at position (45, 49).
; PLAN: r0=45(x), r1=49(y), r2=24(width), r3=83(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 45
LDI r1, 49
LDI r2, 24
LDI r3, 83
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
