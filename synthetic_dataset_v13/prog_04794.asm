; DESCRIPTION: Draws a cyan rectangle at (393, 60) with width 107 and height 80.
; PLAN: r0=393(x), r1=60(y), r2=107(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 393
LDI r1, 60
LDI r2, 107
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
