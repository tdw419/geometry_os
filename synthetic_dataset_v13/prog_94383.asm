; DESCRIPTION: Draws a cyan rectangle at (269, 244) with width 117 and height 10.
; PLAN: r0=269(x), r1=244(y), r2=117(width), r3=10(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 269
LDI r1, 244
LDI r2, 117
LDI r3, 10
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
