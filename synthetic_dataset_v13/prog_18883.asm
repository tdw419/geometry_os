; DESCRIPTION: Creates a cyan rectangular region at (90, 149) spanning 27 by 15 pixels.
; PLAN: r0=90(x), r1=149(y), r2=27(width), r3=15(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 90
LDI r1, 149
LDI r2, 27
LDI r3, 15
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
