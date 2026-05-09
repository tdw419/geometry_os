; DESCRIPTION: Creates a cyan rectangular region at (263, 145) spanning 83 by 48 pixels.
; PLAN: r0=263(x), r1=145(y), r2=83(width), r3=48(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 263
LDI r1, 145
LDI r2, 83
LDI r3, 48
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
