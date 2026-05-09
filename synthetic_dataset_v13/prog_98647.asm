; DESCRIPTION: Draws a magenta rectangle at (443, 47) with width 42 and height 92.
; PLAN: r0=443(x), r1=47(y), r2=42(width), r3=92(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 443
LDI r1, 47
LDI r2, 42
LDI r3, 92
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
