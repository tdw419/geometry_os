; DESCRIPTION: Draws a cyan rectangle at (308, 52) with width 66 and height 120.
; PLAN: r0=308(x), r1=52(y), r2=66(width), r3=120(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 308
LDI r1, 52
LDI r2, 66
LDI r3, 120
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
