; DESCRIPTION: Draws a magenta rectangle at (434, 46) with width 16 and height 93.
; PLAN: r0=434(x), r1=46(y), r2=16(width), r3=93(height), r4=0xFF00FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 434
LDI r1, 46
LDI r2, 16
LDI r3, 93
LDI r4, 0xFF00FF
RECTF r0, r1, r2, r3, r4
HALT
