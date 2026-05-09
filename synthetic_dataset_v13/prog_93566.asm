; DESCRIPTION: Creates a cyan rectangular region at (403, 136) spanning 51 by 62 pixels.
; PLAN: r0=403(x), r1=136(y), r2=51(width), r3=62(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 403
LDI r1, 136
LDI r2, 51
LDI r3, 62
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
