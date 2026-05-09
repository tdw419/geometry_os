; DESCRIPTION: Creates a cyan rectangular region at (386, 65) spanning 107 by 94 pixels.
; PLAN: r0=386(x), r1=65(y), r2=107(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 386
LDI r1, 65
LDI r2, 107
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
