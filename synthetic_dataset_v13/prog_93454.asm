; DESCRIPTION: Creates a cyan rectangular region at (369, 142) spanning 22 by 12 pixels.
; PLAN: r0=369(x), r1=142(y), r2=22(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 369
LDI r1, 142
LDI r2, 22
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
