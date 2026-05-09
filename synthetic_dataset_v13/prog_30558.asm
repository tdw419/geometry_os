; DESCRIPTION: Creates a cyan rectangular region at (208, 127) spanning 114 by 67 pixels.
; PLAN: r0=208(x), r1=127(y), r2=114(width), r3=67(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 208
LDI r1, 127
LDI r2, 114
LDI r3, 67
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
