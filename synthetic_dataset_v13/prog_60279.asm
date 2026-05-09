; DESCRIPTION: Creates a cyan rectangular region at (211, 188) spanning 12 by 60 pixels.
; PLAN: r0=211(x), r1=188(y), r2=12(width), r3=60(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 211
LDI r1, 188
LDI r2, 12
LDI r3, 60
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
