; DESCRIPTION: Creates a green rectangular region at (327, 126) spanning 36 by 14 pixels.
; PLAN: r0=327(x), r1=126(y), r2=36(width), r3=14(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 126
LDI r2, 36
LDI r3, 14
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
