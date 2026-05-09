; DESCRIPTION: Creates a cyan rectangular region at (187, 193) spanning 105 by 30 pixels.
; PLAN: r0=187(x), r1=193(y), r2=105(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 193
LDI r2, 105
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
