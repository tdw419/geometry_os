; DESCRIPTION: Draws a cyan rectangle at (321, 93) with width 24 and height 70.
; PLAN: r0=321(x), r1=93(y), r2=24(width), r3=70(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 321
LDI r1, 93
LDI r2, 24
LDI r3, 70
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
