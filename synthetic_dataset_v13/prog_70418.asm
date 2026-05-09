; DESCRIPTION: Creates a cyan rectangular region at (274, 21) spanning 93 by 55 pixels.
; PLAN: r0=274(x), r1=21(y), r2=93(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 274
LDI r1, 21
LDI r2, 93
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
