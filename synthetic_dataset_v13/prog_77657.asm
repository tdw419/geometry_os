; DESCRIPTION: Creates a green rectangular region at (234, 212) spanning 103 by 32 pixels.
; PLAN: r0=234(x), r1=212(y), r2=103(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 234
LDI r1, 212
LDI r2, 103
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
