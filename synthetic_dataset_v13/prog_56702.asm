; DESCRIPTION: Draws a cyan rectangle at (394, 51) with width 54 and height 59.
; PLAN: r0=394(x), r1=51(y), r2=54(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 394
LDI r1, 51
LDI r2, 54
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
