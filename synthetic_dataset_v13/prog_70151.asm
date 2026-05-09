; DESCRIPTION: Creates a green rectangular region at (305, 132) spanning 47 by 115 pixels.
; PLAN: r0=305(x), r1=132(y), r2=47(width), r3=115(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 305
LDI r1, 132
LDI r2, 47
LDI r3, 115
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
