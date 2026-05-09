; DESCRIPTION: Creates a yellow rectangular region at (210, 20) spanning 10 by 120 pixels.
; PLAN: r0=210(x), r1=20(y), r2=10(width), r3=120(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 210
LDI r1, 20
LDI r2, 10
LDI r3, 120
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
