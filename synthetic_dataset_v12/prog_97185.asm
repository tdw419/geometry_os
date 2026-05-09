; DESCRIPTION: Creates a cyan rectangular region at (92, 0) spanning 105 by 25 pixels.
; PLAN: r0=92(x), r1=0(y), r2=105(width), r3=25(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 0
LDI r2, 105
LDI r3, 25
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
