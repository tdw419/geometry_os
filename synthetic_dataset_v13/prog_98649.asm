; DESCRIPTION: Draws a cyan rectangle at (187, 143) with width 93 and height 73.
; PLAN: r0=187(x), r1=143(y), r2=93(width), r3=73(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 143
LDI r2, 93
LDI r3, 73
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
