; DESCRIPTION: Places a cyan 75x45 rectangle at position (12, 136).
; PLAN: r0=12(x), r1=136(y), r2=75(width), r3=45(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 12
LDI r1, 136
LDI r2, 75
LDI r3, 45
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
