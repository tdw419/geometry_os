; DESCRIPTION: Creates a cyan rectangular region at (368, 57) spanning 115 by 22 pixels.
; PLAN: r0=368(x), r1=57(y), r2=115(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 368
LDI r1, 57
LDI r2, 115
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
