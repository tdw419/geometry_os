; DESCRIPTION: Creates a cyan rectangular region at (346, 97) spanning 35 by 63 pixels.
; PLAN: r0=346(x), r1=97(y), r2=35(width), r3=63(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 97
LDI r2, 35
LDI r3, 63
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
