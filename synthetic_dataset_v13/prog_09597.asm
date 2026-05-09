; DESCRIPTION: Creates a green rectangular region at (408, 2) spanning 93 by 37 pixels.
; PLAN: r0=408(x), r1=2(y), r2=93(width), r3=37(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 2
LDI r2, 93
LDI r3, 37
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
