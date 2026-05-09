; DESCRIPTION: Creates a black rectangular region at (480, 169) spanning 27 by 52 pixels.
; PLAN: r0=480(x), r1=169(y), r2=27(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 480
LDI r1, 169
LDI r2, 27
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
