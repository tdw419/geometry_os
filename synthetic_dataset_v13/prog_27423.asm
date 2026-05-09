; DESCRIPTION: Creates a green rectangular region at (383, 214) spanning 61 by 31 pixels.
; PLAN: r0=383(x), r1=214(y), r2=61(width), r3=31(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 383
LDI r1, 214
LDI r2, 61
LDI r3, 31
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
