; DESCRIPTION: Creates a cyan rectangular region at (317, 200) spanning 43 by 46 pixels.
; PLAN: r0=317(x), r1=200(y), r2=43(width), r3=46(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 200
LDI r2, 43
LDI r3, 46
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
