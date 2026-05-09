; DESCRIPTION: Creates a cyan rectangular region at (112, 49) spanning 115 by 111 pixels.
; PLAN: r0=112(x), r1=49(y), r2=115(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 49
LDI r2, 115
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
