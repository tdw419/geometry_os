; DESCRIPTION: Draws a red rectangle at (85, 50) with width 65 and height 42.
; PLAN: r0=85(x), r1=50(y), r2=65(width), r3=42(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 85
LDI r1, 50
LDI r2, 65
LDI r3, 42
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
