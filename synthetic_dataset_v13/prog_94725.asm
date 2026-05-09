; DESCRIPTION: Draws a green rectangle at (214, 74) with width 42 and height 111.
; PLAN: r0=214(x), r1=74(y), r2=42(width), r3=111(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 214
LDI r1, 74
LDI r2, 42
LDI r3, 111
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
