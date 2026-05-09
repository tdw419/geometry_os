; DESCRIPTION: Places a cyan 60x48 rectangle at position (136, 123).
; PLAN: r0=136(x), r1=123(y), r2=60(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 123
LDI r2, 60
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
