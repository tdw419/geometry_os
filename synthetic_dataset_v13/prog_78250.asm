; DESCRIPTION: Places a cyan 12x31 rectangle at position (136, 40).
; PLAN: r0=136(x), r1=40(y), r2=12(width), r3=31(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 40
LDI r2, 12
LDI r3, 31
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
