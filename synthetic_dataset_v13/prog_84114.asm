; DESCRIPTION: Creates a cyan rectangular region at (282, 154) spanning 37 by 102 pixels.
; PLAN: r0=282(x), r1=154(y), r2=37(width), r3=102(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 154
LDI r2, 37
LDI r3, 102
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
