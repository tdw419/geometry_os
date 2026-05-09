; DESCRIPTION: Creates a cyan rectangular region at (64, 13) spanning 51 by 80 pixels.
; PLAN: r0=64(x), r1=13(y), r2=51(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 64
LDI r1, 13
LDI r2, 51
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
