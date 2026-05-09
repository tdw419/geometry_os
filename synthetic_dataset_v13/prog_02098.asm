; DESCRIPTION: Draws a cyan rectangle at (295, 163) with width 65 and height 91.
; PLAN: r0=295(x), r1=163(y), r2=65(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 163
LDI r2, 65
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
