; DESCRIPTION: Creates a cyan rectangular region at (159, 43) spanning 119 by 16 pixels.
; PLAN: r0=159(x), r1=43(y), r2=119(width), r3=16(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 159
LDI r1, 43
LDI r2, 119
LDI r3, 16
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
