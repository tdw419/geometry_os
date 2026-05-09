; DESCRIPTION: Creates a cyan rectangular region at (395, 63) spanning 49 by 111 pixels.
; PLAN: r0=395(x), r1=63(y), r2=49(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 395
LDI r1, 63
LDI r2, 49
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
