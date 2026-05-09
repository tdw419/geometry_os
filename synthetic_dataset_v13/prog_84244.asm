; DESCRIPTION: Creates a cyan rectangular region at (311, 25) spanning 111 by 83 pixels.
; PLAN: r0=311(x), r1=25(y), r2=111(width), r3=83(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 311
LDI r1, 25
LDI r2, 111
LDI r3, 83
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
