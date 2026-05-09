; DESCRIPTION: Creates a green rectangular region at (254, 120) spanning 92 by 109 pixels.
; PLAN: r0=254(x), r1=120(y), r2=92(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 254
LDI r1, 120
LDI r2, 92
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
