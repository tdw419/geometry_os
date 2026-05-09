; DESCRIPTION: Creates a green rectangular region at (403, 48) spanning 102 by 57 pixels.
; PLAN: r0=403(x), r1=48(y), r2=102(width), r3=57(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 48
LDI r2, 102
LDI r3, 57
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
