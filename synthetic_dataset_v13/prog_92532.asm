; DESCRIPTION: Creates a green rectangular region at (322, 42) spanning 58 by 18 pixels.
; PLAN: r0=322(x), r1=42(y), r2=58(width), r3=18(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 322
LDI r1, 42
LDI r2, 58
LDI r3, 18
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
