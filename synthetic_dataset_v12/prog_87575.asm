; DESCRIPTION: Creates a yellow rectangular region at (446, 42) spanning 17 by 51 pixels.
; PLAN: r0=446(x), r1=42(y), r2=17(width), r3=51(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 446
LDI r1, 42
LDI r2, 17
LDI r3, 51
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
