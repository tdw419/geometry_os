; DESCRIPTION: Places a cyan 60x37 rectangle at position (113, 185).
; PLAN: r0=113(x), r1=185(y), r2=60(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 185
LDI r2, 60
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
