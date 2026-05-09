; DESCRIPTION: Draws a red rectangle at (146, 46) with width 89 and height 111.
; PLAN: r0=146(x), r1=46(y), r2=89(width), r3=111(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 46
LDI r2, 89
LDI r3, 111
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
