; DESCRIPTION: Places a green 60x82 rectangle at position (188, 147).
; PLAN: r0=188(x), r1=147(y), r2=60(width), r3=82(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 188
LDI r1, 147
LDI r2, 60
LDI r3, 82
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
