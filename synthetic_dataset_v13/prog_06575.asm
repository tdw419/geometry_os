; DESCRIPTION: Creates a cyan rectangular region at (252, 177) spanning 65 by 65 pixels.
; PLAN: r0=252(x), r1=177(y), r2=65(width), r3=65(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 252
LDI r1, 177
LDI r2, 65
LDI r3, 65
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
