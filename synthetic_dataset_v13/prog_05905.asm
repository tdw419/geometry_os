; DESCRIPTION: Creates a green rectangular region at (162, 150) spanning 51 by 61 pixels.
; PLAN: r0=162(x), r1=150(y), r2=51(width), r3=61(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 162
LDI r1, 150
LDI r2, 51
LDI r3, 61
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
