; DESCRIPTION: Creates a cyan rectangular region at (147, 22) spanning 82 by 18 pixels.
; PLAN: r0=147(x), r1=22(y), r2=82(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 147
LDI r1, 22
LDI r2, 82
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
