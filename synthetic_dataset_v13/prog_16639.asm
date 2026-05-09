; DESCRIPTION: Creates a cyan rectangular region at (322, 23) spanning 48 by 49 pixels.
; PLAN: r0=322(x), r1=23(y), r2=48(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 23
LDI r2, 48
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
