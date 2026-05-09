; DESCRIPTION: Creates a yellow rectangular region at (44, 48) spanning 16 by 23 pixels.
; PLAN: r0=44(x), r1=48(y), r2=16(width), r3=23(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 44
LDI r1, 48
LDI r2, 16
LDI r3, 23
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
