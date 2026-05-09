; DESCRIPTION: Creates a cyan rectangular region at (226, 127) spanning 49 by 10 pixels.
; PLAN: r0=226(x), r1=127(y), r2=49(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 226
LDI r1, 127
LDI r2, 49
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
