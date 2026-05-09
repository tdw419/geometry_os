; DESCRIPTION: Creates a black rectangular region at (440, 89) spanning 65 by 52 pixels.
; PLAN: r0=440(x), r1=89(y), r2=65(width), r3=52(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 440
LDI r1, 89
LDI r2, 65
LDI r3, 52
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
