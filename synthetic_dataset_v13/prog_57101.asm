; DESCRIPTION: Creates a cyan rectangular region at (79, 128) spanning 92 by 36 pixels.
; PLAN: r0=79(x), r1=128(y), r2=92(width), r3=36(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 128
LDI r2, 92
LDI r3, 36
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
