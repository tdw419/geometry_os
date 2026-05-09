; DESCRIPTION: Creates a cyan rectangular region at (202, 24) spanning 29 by 106 pixels.
; PLAN: r0=202(x), r1=24(y), r2=29(width), r3=106(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 24
LDI r2, 29
LDI r3, 106
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
