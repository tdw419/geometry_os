; DESCRIPTION: Creates a cyan rectangular region at (63, 138) spanning 95 by 75 pixels.
; PLAN: r0=63(x), r1=138(y), r2=95(width), r3=75(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 63
LDI r1, 138
LDI r2, 95
LDI r3, 75
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
