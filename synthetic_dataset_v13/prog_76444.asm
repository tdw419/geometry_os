; DESCRIPTION: Creates a cyan rectangular region at (205, 7) spanning 93 by 75 pixels.
; PLAN: r0=205(x), r1=7(y), r2=93(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 205
LDI r1, 7
LDI r2, 93
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
