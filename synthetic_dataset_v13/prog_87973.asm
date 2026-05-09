; DESCRIPTION: Draws a cyan rectangle at (103, 165) with width 113 and height 61.
; PLAN: r0=103(x), r1=165(y), r2=113(width), r3=61(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 165
LDI r2, 113
LDI r3, 61
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
