; DESCRIPTION: Draws a yellow rectangle at (171, 141) with width 42 and height 113.
; PLAN: r0=171(x), r1=141(y), r2=42(width), r3=113(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 141
LDI r2, 42
LDI r3, 113
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
