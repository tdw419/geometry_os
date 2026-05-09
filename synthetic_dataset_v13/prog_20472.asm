; DESCRIPTION: Creates a cyan rectangular region at (170, 149) spanning 94 by 63 pixels.
; PLAN: r0=170(x), r1=149(y), r2=94(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 170
LDI r1, 149
LDI r2, 94
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
