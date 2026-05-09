; DESCRIPTION: Creates a cyan rectangular region at (149, 6) spanning 92 by 27 pixels.
; PLAN: r0=149(x), r1=6(y), r2=92(width), r3=27(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 149
LDI r1, 6
LDI r2, 92
LDI r3, 27
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
