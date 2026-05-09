; DESCRIPTION: Draws a cyan rectangle at (201, 146) with width 85 and height 91.
; PLAN: r0=201(x), r1=146(y), r2=85(width), r3=91(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 201
LDI r1, 146
LDI r2, 85
LDI r3, 91
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
