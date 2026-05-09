; DESCRIPTION: Creates a cyan rectangular region at (237, 68) spanning 29 by 43 pixels.
; PLAN: r0=237(x), r1=68(y), r2=29(width), r3=43(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 68
LDI r2, 29
LDI r3, 43
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
