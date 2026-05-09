; DESCRIPTION: Creates a cyan rectangular region at (393, 40) spanning 79 by 32 pixels.
; PLAN: r0=393(x), r1=40(y), r2=79(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 40
LDI r2, 79
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
