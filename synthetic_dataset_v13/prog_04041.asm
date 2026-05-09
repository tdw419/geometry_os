; DESCRIPTION: Creates a cyan rectangular region at (331, 124) spanning 105 by 111 pixels.
; PLAN: r0=331(x), r1=124(y), r2=105(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 124
LDI r2, 105
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
