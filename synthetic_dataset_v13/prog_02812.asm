; DESCRIPTION: Creates a cyan rectangular region at (462, 109) spanning 47 by 94 pixels.
; PLAN: r0=462(x), r1=109(y), r2=47(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 462
LDI r1, 109
LDI r2, 47
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
