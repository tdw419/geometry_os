; DESCRIPTION: Creates a yellow rectangular region at (187, 186) spanning 55 by 70 pixels.
; PLAN: r0=187(x), r1=186(y), r2=55(width), r3=70(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 186
LDI r2, 55
LDI r3, 70
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
