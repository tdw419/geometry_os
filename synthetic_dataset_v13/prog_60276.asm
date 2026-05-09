; DESCRIPTION: Creates a cyan rectangular region at (350, 221) spanning 97 by 26 pixels.
; PLAN: r0=350(x), r1=221(y), r2=97(width), r3=26(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 221
LDI r2, 97
LDI r3, 26
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
