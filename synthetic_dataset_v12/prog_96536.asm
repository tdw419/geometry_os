; DESCRIPTION: Creates a cyan rectangular region at (21, 47) spanning 40 by 35 pixels.
; PLAN: r0=21(x), r1=47(y), r2=40(width), r3=35(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 21
LDI r1, 47
LDI r2, 40
LDI r3, 35
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
