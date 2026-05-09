; DESCRIPTION: Places a cyan 31x30 rectangle at position (163, 130).
; PLAN: r0=163(x), r1=130(y), r2=31(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 163
LDI r1, 130
LDI r2, 31
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
