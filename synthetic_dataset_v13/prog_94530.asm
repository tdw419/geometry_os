; DESCRIPTION: Creates a green rectangular region at (271, 147) spanning 94 by 16 pixels.
; PLAN: r0=271(x), r1=147(y), r2=94(width), r3=16(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 271
LDI r1, 147
LDI r2, 94
LDI r3, 16
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
