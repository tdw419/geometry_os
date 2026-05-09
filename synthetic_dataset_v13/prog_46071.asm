; DESCRIPTION: Draws a cyan rectangle at (346, 127) with width 112 and height 34.
; PLAN: r0=346(x), r1=127(y), r2=112(width), r3=34(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 346
LDI r1, 127
LDI r2, 112
LDI r3, 34
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
