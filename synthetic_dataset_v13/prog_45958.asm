; DESCRIPTION: Creates a cyan rectangular region at (57, 95) spanning 54 by 91 pixels.
; PLAN: r0=57(x), r1=95(y), r2=54(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 57
LDI r1, 95
LDI r2, 54
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
