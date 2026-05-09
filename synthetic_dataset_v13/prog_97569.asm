; DESCRIPTION: Draws a blue rectangle at (394, 127) with width 58 and height 31.
; PLAN: r0=394(x), r1=127(y), r2=58(width), r3=31(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 127
LDI r2, 58
LDI r3, 31
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
