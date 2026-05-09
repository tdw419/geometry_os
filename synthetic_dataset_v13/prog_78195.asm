; DESCRIPTION: Creates a cyan rectangular region at (256, 34) spanning 70 by 111 pixels.
; PLAN: r0=256(x), r1=34(y), r2=70(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 256
LDI r1, 34
LDI r2, 70
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
