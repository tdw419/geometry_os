; DESCRIPTION: Creates a green rectangular region at (69, 154) spanning 81 by 51 pixels.
; PLAN: r0=69(x), r1=154(y), r2=81(width), r3=51(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 69
LDI r1, 154
LDI r2, 81
LDI r3, 51
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
