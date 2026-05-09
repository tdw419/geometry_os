; DESCRIPTION: Creates a cyan rectangular region at (29, 22) spanning 87 by 22 pixels.
; PLAN: r0=29(x), r1=22(y), r2=87(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 29
LDI r1, 22
LDI r2, 87
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
