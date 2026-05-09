; DESCRIPTION: Creates a cyan rectangular region at (25, 24) spanning 69 by 111 pixels.
; PLAN: r0=25(x), r1=24(y), r2=69(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 25
LDI r1, 24
LDI r2, 69
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
