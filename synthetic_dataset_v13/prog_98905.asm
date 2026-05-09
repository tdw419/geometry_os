; DESCRIPTION: Creates a cyan rectangular region at (168, 8) spanning 75 by 91 pixels.
; PLAN: r0=168(x), r1=8(y), r2=75(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 8
LDI r2, 75
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
