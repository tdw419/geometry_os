; DESCRIPTION: Creates a blue rectangular region at (177, 37) spanning 65 by 48 pixels.
; PLAN: r0=177(x), r1=37(y), r2=65(width), r3=48(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 37
LDI r2, 65
LDI r3, 48
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
