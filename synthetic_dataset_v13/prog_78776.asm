; DESCRIPTION: Creates a cyan rectangular region at (453, 146) spanning 13 by 98 pixels.
; PLAN: r0=453(x), r1=146(y), r2=13(width), r3=98(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 453
LDI r1, 146
LDI r2, 13
LDI r3, 98
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
