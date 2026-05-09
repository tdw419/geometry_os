; DESCRIPTION: Creates a cyan rectangular region at (293, 143) spanning 115 by 10 pixels.
; PLAN: r0=293(x), r1=143(y), r2=115(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 293
LDI r1, 143
LDI r2, 115
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
