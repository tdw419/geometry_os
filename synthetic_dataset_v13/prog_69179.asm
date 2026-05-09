; DESCRIPTION: Creates a green rectangular region at (445, 150) spanning 54 by 96 pixels.
; PLAN: r0=445(x), r1=150(y), r2=54(width), r3=96(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 150
LDI r2, 54
LDI r3, 96
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
