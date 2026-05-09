; DESCRIPTION: Creates a green rectangular region at (80, 131) spanning 47 by 81 pixels.
; PLAN: r0=80(x), r1=131(y), r2=47(width), r3=81(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 80
LDI r1, 131
LDI r2, 47
LDI r3, 81
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
