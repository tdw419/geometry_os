; DESCRIPTION: Creates a cyan rectangular region at (329, 117) spanning 110 by 63 pixels.
; PLAN: r0=329(x), r1=117(y), r2=110(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 329
LDI r1, 117
LDI r2, 110
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
