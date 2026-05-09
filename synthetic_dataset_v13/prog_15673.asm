; DESCRIPTION: Creates a blue rectangular region at (242, 169) spanning 23 by 16 pixels.
; PLAN: r0=242(x), r1=169(y), r2=23(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 242
LDI r1, 169
LDI r2, 23
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
