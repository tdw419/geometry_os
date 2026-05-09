; DESCRIPTION: Creates a cyan rectangular region at (136, 153) spanning 98 by 63 pixels.
; PLAN: r0=136(x), r1=153(y), r2=98(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 136
LDI r1, 153
LDI r2, 98
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
