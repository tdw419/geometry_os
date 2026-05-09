; DESCRIPTION: Creates a cyan rectangular region at (160, 142) spanning 48 by 79 pixels.
; PLAN: r0=160(x), r1=142(y), r2=48(width), r3=79(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 160
LDI r1, 142
LDI r2, 48
LDI r3, 79
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
