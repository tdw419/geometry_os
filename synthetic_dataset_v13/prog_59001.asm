; DESCRIPTION: Creates a green rectangular region at (262, 153) spanning 25 by 44 pixels.
; PLAN: r0=262(x), r1=153(y), r2=25(width), r3=44(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 153
LDI r2, 25
LDI r3, 44
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
