; DESCRIPTION: Draws a cyan rectangle at (259, 177) with width 47 and height 12.
; PLAN: r0=259(x), r1=177(y), r2=47(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 259
LDI r1, 177
LDI r2, 47
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
