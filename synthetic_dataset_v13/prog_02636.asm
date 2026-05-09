; DESCRIPTION: Draws a cyan rectangle at (406, 26) with width 55 and height 42.
; PLAN: r0=406(x), r1=26(y), r2=55(width), r3=42(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 406
LDI r1, 26
LDI r2, 55
LDI r3, 42
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
