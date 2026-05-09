; DESCRIPTION: Creates a cyan rectangular region at (75, 132) spanning 17 by 57 pixels.
; PLAN: r0=75(x), r1=132(y), r2=17(width), r3=57(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 75
LDI r1, 132
LDI r2, 17
LDI r3, 57
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
