; DESCRIPTION: Creates a green rectangular region at (245, 48) spanning 94 by 36 pixels.
; PLAN: r0=245(x), r1=48(y), r2=94(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 245
LDI r1, 48
LDI r2, 94
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
