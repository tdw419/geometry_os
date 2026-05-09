; DESCRIPTION: Creates a cyan rectangular region at (217, 197) spanning 35 by 37 pixels.
; PLAN: r0=217(x), r1=197(y), r2=35(width), r3=37(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 217
LDI r1, 197
LDI r2, 35
LDI r3, 37
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
