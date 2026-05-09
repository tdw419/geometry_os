; DESCRIPTION: Creates a cyan rectangular region at (387, 92) spanning 33 by 37 pixels.
; PLAN: r0=387(x), r1=92(y), r2=33(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 92
LDI r2, 33
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
