; DESCRIPTION: Renders a cyan box of size 113x54 starting at (100, 15).
; PLAN: r0=100(x), r1=15(y), r2=113(width), r3=54(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 100
LDI r1, 15
LDI r2, 113
LDI r3, 54
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
