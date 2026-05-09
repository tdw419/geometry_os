; DESCRIPTION: Creates a cyan rectangular region at (382, 150) spanning 37 by 94 pixels.
; PLAN: r0=382(x), r1=150(y), r2=37(width), r3=94(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 382
LDI r1, 150
LDI r2, 37
LDI r3, 94
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
