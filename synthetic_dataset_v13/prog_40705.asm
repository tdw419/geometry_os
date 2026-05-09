; DESCRIPTION: Renders a white box of size 83x92 starting at (412, 65).
; PLAN: r0=412(x), r1=65(y), r2=83(width), r3=92(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 412
LDI r1, 65
LDI r2, 83
LDI r3, 92
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
