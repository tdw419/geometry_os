; DESCRIPTION: Creates a green rectangular region at (333, 75) spanning 120 by 120 pixels.
; PLAN: r0=333(x), r1=75(y), r2=120(width), r3=120(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 75
LDI r2, 120
LDI r3, 120
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
