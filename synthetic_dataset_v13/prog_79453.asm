; DESCRIPTION: Creates a cyan rectangular region at (202, 144) spanning 35 by 90 pixels.
; PLAN: r0=202(x), r1=144(y), r2=35(width), r3=90(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 144
LDI r2, 35
LDI r3, 90
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
