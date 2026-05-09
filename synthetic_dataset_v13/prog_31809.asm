; DESCRIPTION: Creates a cyan rectangular region at (353, 147) spanning 85 by 65 pixels.
; PLAN: r0=353(x), r1=147(y), r2=85(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 353
LDI r1, 147
LDI r2, 85
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
