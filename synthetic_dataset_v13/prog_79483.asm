; DESCRIPTION: Draws a cyan rectangle at (445, 47) with width 65 and height 12.
; PLAN: r0=445(x), r1=47(y), r2=65(width), r3=12(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 47
LDI r2, 65
LDI r3, 12
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
