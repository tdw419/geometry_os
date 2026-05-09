; DESCRIPTION: Draws a cyan rectangle at (42, 73) with width 42 and height 111.
; PLAN: r0=42(x), r1=73(y), r2=42(width), r3=111(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 42
LDI r1, 73
LDI r2, 42
LDI r3, 111
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
