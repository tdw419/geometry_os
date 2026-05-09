; DESCRIPTION: Creates a cyan rectangular region at (349, 133) spanning 59 by 22 pixels.
; PLAN: r0=349(x), r1=133(y), r2=59(width), r3=22(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 349
LDI r1, 133
LDI r2, 59
LDI r3, 22
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
