; DESCRIPTION: Draws a cyan rectangle at (439, 197) with width 73 and height 52.
; PLAN: r0=439(x), r1=197(y), r2=73(width), r3=52(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 439
LDI r1, 197
LDI r2, 73
LDI r3, 52
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
