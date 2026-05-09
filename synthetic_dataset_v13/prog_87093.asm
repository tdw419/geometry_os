; DESCRIPTION: Creates a green rectangular region at (236, 126) spanning 93 by 16 pixels.
; PLAN: r0=236(x), r1=126(y), r2=93(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 236
LDI r1, 126
LDI r2, 93
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
