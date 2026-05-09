; DESCRIPTION: Creates a cyan rectangular region at (207, 169) spanning 37 by 22 pixels.
; PLAN: r0=207(x), r1=169(y), r2=37(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 207
LDI r1, 169
LDI r2, 37
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
