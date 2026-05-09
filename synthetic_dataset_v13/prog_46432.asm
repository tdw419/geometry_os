; DESCRIPTION: Creates a cyan rectangular region at (374, 85) spanning 115 by 105 pixels.
; PLAN: r0=374(x), r1=85(y), r2=115(width), r3=105(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 85
LDI r2, 115
LDI r3, 105
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
