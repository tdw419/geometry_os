; DESCRIPTION: Creates a cyan rectangular region at (450, 187) spanning 37 by 28 pixels.
; PLAN: r0=450(x), r1=187(y), r2=37(width), r3=28(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 450
LDI r1, 187
LDI r2, 37
LDI r3, 28
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
