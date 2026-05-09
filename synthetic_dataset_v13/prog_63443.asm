; DESCRIPTION: Creates a cyan rectangular region at (142, 10) spanning 43 by 30 pixels.
; PLAN: r0=142(x), r1=10(y), r2=43(width), r3=30(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 142
LDI r1, 10
LDI r2, 43
LDI r3, 30
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
