; DESCRIPTION: Renders a blue box of size 39x87 starting at (285, 55).
; PLAN: r0=285(x), r1=55(y), r2=39(width), r3=87(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 55
LDI r2, 39
LDI r3, 87
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
