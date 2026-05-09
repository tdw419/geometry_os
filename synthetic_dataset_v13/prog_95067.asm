; DESCRIPTION: Creates a cyan rectangular region at (74, 36) spanning 86 by 107 pixels.
; PLAN: r0=74(x), r1=36(y), r2=86(width), r3=107(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 74
LDI r1, 36
LDI r2, 86
LDI r3, 107
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
