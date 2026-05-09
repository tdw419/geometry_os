; DESCRIPTION: Creates a green rectangular region at (242, 131) spanning 23 by 79 pixels.
; PLAN: r0=242(x), r1=131(y), r2=23(width), r3=79(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 131
LDI r2, 23
LDI r3, 79
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
