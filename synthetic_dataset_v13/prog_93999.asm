; DESCRIPTION: Creates a cyan rectangular region at (327, 61) spanning 77 by 92 pixels.
; PLAN: r0=327(x), r1=61(y), r2=77(width), r3=92(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 327
LDI r1, 61
LDI r2, 77
LDI r3, 92
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
