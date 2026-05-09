; DESCRIPTION: Creates a cyan rectangular region at (217, 72) spanning 90 by 32 pixels.
; PLAN: r0=217(x), r1=72(y), r2=90(width), r3=32(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 72
LDI r2, 90
LDI r3, 32
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
