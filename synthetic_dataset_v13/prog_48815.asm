; DESCRIPTION: Places a green 65x95 rectangle at position (136, 4).
; PLAN: r0=136(x), r1=4(y), r2=65(width), r3=95(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 4
LDI r2, 65
LDI r3, 95
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
