; DESCRIPTION: Creates a cyan rectangular region at (57, 183) spanning 117 by 29 pixels.
; PLAN: r0=57(x), r1=183(y), r2=117(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 183
LDI r2, 117
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
