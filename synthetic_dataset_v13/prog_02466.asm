; DESCRIPTION: Draws a cyan rectangle at (405, 111) with width 65 and height 109.
; PLAN: r0=405(x), r1=111(y), r2=65(width), r3=109(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 111
LDI r2, 65
LDI r3, 109
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
