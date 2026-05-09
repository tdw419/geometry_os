; DESCRIPTION: Draws a cyan rectangle at (146, 72) with width 107 and height 55.
; PLAN: r0=146(x), r1=72(y), r2=107(width), r3=55(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 72
LDI r2, 107
LDI r3, 55
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
