; DESCRIPTION: Creates a cyan rectangular region at (488, 105) spanning 12 by 87 pixels.
; PLAN: r0=488(x), r1=105(y), r2=12(width), r3=87(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 488
LDI r1, 105
LDI r2, 12
LDI r3, 87
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
