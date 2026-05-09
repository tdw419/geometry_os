; DESCRIPTION: Draws a cyan rectangle at (221, 182) with width 27 and height 49.
; PLAN: r0=221(x), r1=182(y), r2=27(width), r3=49(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 221
LDI r1, 182
LDI r2, 27
LDI r3, 49
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
