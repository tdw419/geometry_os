; DESCRIPTION: Creates a cyan rectangular region at (445, 165) spanning 54 by 34 pixels.
; PLAN: r0=445(x), r1=165(y), r2=54(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 165
LDI r2, 54
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
