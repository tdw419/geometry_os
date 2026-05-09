; DESCRIPTION: Creates a cyan rectangular region at (33, 7) spanning 22 by 92 pixels.
; PLAN: r0=33(x), r1=7(y), r2=22(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 33
LDI r1, 7
LDI r2, 22
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
