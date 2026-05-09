; DESCRIPTION: Creates a cyan rectangular region at (265, 5) spanning 92 by 66 pixels.
; PLAN: r0=265(x), r1=5(y), r2=92(width), r3=66(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 265
LDI r1, 5
LDI r2, 92
LDI r3, 66
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
