; DESCRIPTION: Creates a green rectangular region at (13, 126) spanning 11 by 113 pixels.
; PLAN: r0=13(x), r1=126(y), r2=11(width), r3=113(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 126
LDI r2, 11
LDI r3, 113
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
