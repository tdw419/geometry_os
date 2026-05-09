; DESCRIPTION: Places a yellow 43x19 rectangle at position (222, 92).
; PLAN: r0=222(x), r1=92(y), r2=43(width), r3=19(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 222
LDI r1, 92
LDI r2, 43
LDI r3, 19
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
