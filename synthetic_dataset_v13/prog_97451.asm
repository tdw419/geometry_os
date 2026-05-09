; DESCRIPTION: Creates a cyan rectangular region at (77, 14) spanning 109 by 69 pixels.
; PLAN: r0=77(x), r1=14(y), r2=109(width), r3=69(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 77
LDI r1, 14
LDI r2, 109
LDI r3, 69
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
