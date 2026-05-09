; DESCRIPTION: Creates a cyan rectangular region at (367, 80) spanning 113 by 29 pixels.
; PLAN: r0=367(x), r1=80(y), r2=113(width), r3=29(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 80
LDI r2, 113
LDI r3, 29
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
