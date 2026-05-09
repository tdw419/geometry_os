; DESCRIPTION: Draws a cyan rectangle at (288, 120) with width 19 and height 50.
; PLAN: r0=288(x), r1=120(y), r2=19(width), r3=50(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 288
LDI r1, 120
LDI r2, 19
LDI r3, 50
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
