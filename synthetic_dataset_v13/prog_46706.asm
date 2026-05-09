; DESCRIPTION: Creates a cyan rectangular region at (243, 161) spanning 38 by 83 pixels.
; PLAN: r0=243(x), r1=161(y), r2=38(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 243
LDI r1, 161
LDI r2, 38
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
