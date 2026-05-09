; DESCRIPTION: Creates a cyan rectangular region at (130, 44) spanning 79 by 113 pixels.
; PLAN: r0=130(x), r1=44(y), r2=79(width), r3=113(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 130
LDI r1, 44
LDI r2, 79
LDI r3, 113
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
