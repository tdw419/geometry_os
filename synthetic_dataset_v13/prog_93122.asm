; DESCRIPTION: Creates a green rectangular region at (215, 16) spanning 105 by 105 pixels.
; PLAN: r0=215(x), r1=16(y), r2=105(width), r3=105(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 215
LDI r1, 16
LDI r2, 105
LDI r3, 105
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
