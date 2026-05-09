; DESCRIPTION: Draws a cyan rectangle at (168, 141) with width 117 and height 18.
; PLAN: r0=168(x), r1=141(y), r2=117(width), r3=18(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 141
LDI r2, 117
LDI r3, 18
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
