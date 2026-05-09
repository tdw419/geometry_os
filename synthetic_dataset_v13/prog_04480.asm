; DESCRIPTION: Creates a cyan rectangular region at (342, 1) spanning 94 by 91 pixels.
; PLAN: r0=342(x), r1=1(y), r2=94(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 1
LDI r2, 94
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
