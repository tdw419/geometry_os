; DESCRIPTION: Creates a green rectangular region at (297, 131) spanning 87 by 32 pixels.
; PLAN: r0=297(x), r1=131(y), r2=87(width), r3=32(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 131
LDI r2, 87
LDI r3, 32
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
