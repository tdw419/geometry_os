; DESCRIPTION: Creates a green rectangular region at (230, 204) spanning 28 by 36 pixels.
; PLAN: r0=230(x), r1=204(y), r2=28(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 230
LDI r1, 204
LDI r2, 28
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
