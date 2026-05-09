; DESCRIPTION: Creates a cyan rectangular region at (3, 39) spanning 91 by 103 pixels.
; PLAN: r0=3(x), r1=39(y), r2=91(width), r3=103(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 3
LDI r1, 39
LDI r2, 91
LDI r3, 103
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
