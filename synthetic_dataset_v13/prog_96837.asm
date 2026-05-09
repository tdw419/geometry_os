; DESCRIPTION: Creates a cyan rectangular region at (193, 23) spanning 103 by 37 pixels.
; PLAN: r0=193(x), r1=23(y), r2=103(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 193
LDI r1, 23
LDI r2, 103
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
