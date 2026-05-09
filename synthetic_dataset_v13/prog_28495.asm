; DESCRIPTION: Creates a cyan rectangular region at (453, 153) spanning 45 by 29 pixels.
; PLAN: r0=453(x), r1=153(y), r2=45(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 153
LDI r2, 45
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
