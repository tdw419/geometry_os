; DESCRIPTION: Renders a green box of size 38x36 starting at (261, 42).
; PLAN: r0=261(x), r1=42(y), r2=38(width), r3=36(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 42
LDI r2, 38
LDI r3, 36
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
