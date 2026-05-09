; DESCRIPTION: Creates a cyan rectangular region at (109, 177) spanning 88 by 38 pixels.
; PLAN: r0=109(x), r1=177(y), r2=88(width), r3=38(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 109
LDI r1, 177
LDI r2, 88
LDI r3, 38
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
