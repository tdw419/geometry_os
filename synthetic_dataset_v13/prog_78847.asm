; DESCRIPTION: Renders a cyan box of size 100x85 starting at (196, 91).
; PLAN: r0=196(x), r1=91(y), r2=100(width), r3=85(height), r4=0x00FFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 196
LDI r1, 91
LDI r2, 100
LDI r3, 85
LDI r4, 0x00FFFF
RECTF r0, r1, r2, r3, r4
HALT
