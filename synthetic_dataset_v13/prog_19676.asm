; DESCRIPTION: Renders a cyan box of size 25x54 starting at (232, 50).
; PLAN: r0=232(x), r1=50(y), r2=25(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 232
LDI r1, 50
LDI r2, 25
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
