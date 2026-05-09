; DESCRIPTION: Creates a cyan rectangular region at (297, 147) spanning 76 by 71 pixels.
; PLAN: r0=297(x), r1=147(y), r2=76(width), r3=71(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 297
LDI r1, 147
LDI r2, 76
LDI r3, 71
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
