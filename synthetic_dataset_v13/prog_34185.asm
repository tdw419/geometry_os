; DESCRIPTION: Creates a cyan rectangular region at (367, 167) spanning 103 by 56 pixels.
; PLAN: r0=367(x), r1=167(y), r2=103(width), r3=56(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 167
LDI r2, 103
LDI r3, 56
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
