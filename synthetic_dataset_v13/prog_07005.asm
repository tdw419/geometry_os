; DESCRIPTION: Creates a cyan rectangular region at (107, 140) spanning 107 by 98 pixels.
; PLAN: r0=107(x), r1=140(y), r2=107(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 107
LDI r1, 140
LDI r2, 107
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
