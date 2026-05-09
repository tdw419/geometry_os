; DESCRIPTION: Creates a cyan rectangular region at (290, 165) spanning 66 by 80 pixels.
; PLAN: r0=290(x), r1=165(y), r2=66(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 165
LDI r2, 66
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
