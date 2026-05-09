; DESCRIPTION: Creates a cyan rectangular region at (6, 226) spanning 94 by 10 pixels.
; PLAN: r0=6(x), r1=226(y), r2=94(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 6
LDI r1, 226
LDI r2, 94
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
