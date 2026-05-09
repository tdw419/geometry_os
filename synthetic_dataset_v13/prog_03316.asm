; DESCRIPTION: Creates a cyan rectangular region at (408, 22) spanning 90 by 59 pixels.
; PLAN: r0=408(x), r1=22(y), r2=90(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 22
LDI r2, 90
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
