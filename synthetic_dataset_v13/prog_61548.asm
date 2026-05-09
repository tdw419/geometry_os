; DESCRIPTION: Creates a green rectangular region at (202, 59) spanning 39 by 89 pixels.
; PLAN: r0=202(x), r1=59(y), r2=39(width), r3=89(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 202
LDI r1, 59
LDI r2, 39
LDI r3, 89
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
