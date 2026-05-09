; DESCRIPTION: Creates a cyan rectangular region at (161, 32) spanning 111 by 57 pixels.
; PLAN: r0=161(x), r1=32(y), r2=111(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 161
LDI r1, 32
LDI r2, 111
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
