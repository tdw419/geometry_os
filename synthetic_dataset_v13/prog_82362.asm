; DESCRIPTION: Creates a cyan rectangular region at (470, 40) spanning 38 by 69 pixels.
; PLAN: r0=470(x), r1=40(y), r2=38(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 470
LDI r1, 40
LDI r2, 38
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
