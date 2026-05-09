; DESCRIPTION: Creates a cyan rectangular region at (174, 108) spanning 79 by 59 pixels.
; PLAN: r0=174(x), r1=108(y), r2=79(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 174
LDI r1, 108
LDI r2, 79
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
