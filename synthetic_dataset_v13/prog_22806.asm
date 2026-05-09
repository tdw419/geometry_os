; DESCRIPTION: Draws a cyan rectangle at (143, 93) with width 25 and height 42.
; PLAN: r0=143(x), r1=93(y), r2=25(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 93
LDI r2, 25
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
