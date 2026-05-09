; DESCRIPTION: Creates a green rectangular region at (285, 95) spanning 103 by 61 pixels.
; PLAN: r0=285(x), r1=95(y), r2=103(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 95
LDI r2, 103
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
