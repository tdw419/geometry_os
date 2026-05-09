; DESCRIPTION: Draws a cyan rectangle at (328, 196) with width 31 and height 14.
; PLAN: r0=328(x), r1=196(y), r2=31(width), r3=14(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 328
LDI r1, 196
LDI r2, 31
LDI r3, 14
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
