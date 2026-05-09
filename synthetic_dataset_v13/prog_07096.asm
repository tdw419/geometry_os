; DESCRIPTION: Draws a cyan rectangle at (87, 137) with width 109 and height 93.
; PLAN: r0=87(x), r1=137(y), r2=109(width), r3=93(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 137
LDI r2, 109
LDI r3, 93
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
