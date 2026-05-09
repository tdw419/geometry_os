; DESCRIPTION: Creates a cyan rectangular region at (63, 86) spanning 71 by 100 pixels.
; PLAN: r0=63(x), r1=86(y), r2=71(width), r3=100(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 86
LDI r2, 71
LDI r3, 100
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
