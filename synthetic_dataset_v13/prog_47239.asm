; DESCRIPTION: Creates a cyan rectangular region at (282, 97) spanning 70 by 50 pixels.
; PLAN: r0=282(x), r1=97(y), r2=70(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 282
LDI r1, 97
LDI r2, 70
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
