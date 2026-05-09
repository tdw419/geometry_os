; DESCRIPTION: Creates a cyan rectangular region at (95, 153) spanning 31 by 94 pixels.
; PLAN: r0=95(x), r1=153(y), r2=31(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 95
LDI r1, 153
LDI r2, 31
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
