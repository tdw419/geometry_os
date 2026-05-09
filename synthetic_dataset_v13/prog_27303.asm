; DESCRIPTION: Creates a cyan rectangular region at (221, 47) spanning 69 by 83 pixels.
; PLAN: r0=221(x), r1=47(y), r2=69(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 47
LDI r2, 69
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
