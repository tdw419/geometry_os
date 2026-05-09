; DESCRIPTION: Creates a cyan rectangular region at (385, 155) spanning 33 by 54 pixels.
; PLAN: r0=385(x), r1=155(y), r2=33(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 385
LDI r1, 155
LDI r2, 33
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
