; DESCRIPTION: Creates a blue rectangular region at (445, 115) spanning 22 by 16 pixels.
; PLAN: r0=445(x), r1=115(y), r2=22(width), r3=16(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 115
LDI r2, 22
LDI r3, 16
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
