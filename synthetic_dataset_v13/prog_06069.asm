; DESCRIPTION: Draws a cyan rectangle at (262, 109) with width 102 and height 80.
; PLAN: r0=262(x), r1=109(y), r2=102(width), r3=80(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 262
LDI r1, 109
LDI r2, 102
LDI r3, 80
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
