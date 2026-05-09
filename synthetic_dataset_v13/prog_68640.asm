; DESCRIPTION: Draws a cyan rectangle at (262, 174) with width 117 and height 59.
; PLAN: r0=262(x), r1=174(y), r2=117(width), r3=59(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 174
LDI r2, 117
LDI r3, 59
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
