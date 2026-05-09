; DESCRIPTION: Creates a cyan rectangular region at (217, 69) spanning 73 by 111 pixels.
; PLAN: r0=217(x), r1=69(y), r2=73(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 69
LDI r2, 73
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
