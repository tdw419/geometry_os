; DESCRIPTION: Creates a cyan rectangular region at (13, 103) spanning 73 by 37 pixels.
; PLAN: r0=13(x), r1=103(y), r2=73(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 13
LDI r1, 103
LDI r2, 73
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
