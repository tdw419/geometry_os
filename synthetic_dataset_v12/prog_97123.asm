; DESCRIPTION: Draws a cyan rectangle at (317, 59) with width 83 and height 82.
; PLAN: r0=317(x), r1=59(y), r2=83(width), r3=82(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 317
LDI r1, 59
LDI r2, 83
LDI r3, 82
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
