; DESCRIPTION: Draws a red rectangle at (113, 47) with width 111 and height 50.
; PLAN: r0=113(x), r1=47(y), r2=111(width), r3=50(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 113
LDI r1, 47
LDI r2, 111
LDI r3, 50
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
