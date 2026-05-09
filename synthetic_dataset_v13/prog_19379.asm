; DESCRIPTION: Creates a cyan rectangular region at (19, 213) spanning 70 by 19 pixels.
; PLAN: r0=19(x), r1=213(y), r2=70(width), r3=19(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 19
LDI r1, 213
LDI r2, 70
LDI r3, 19
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
