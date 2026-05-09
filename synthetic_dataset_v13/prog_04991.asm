; DESCRIPTION: Renders a green box of size 80x42 starting at (51, 133).
; PLAN: r0=51(x), r1=133(y), r2=80(width), r3=42(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 51
LDI r1, 133
LDI r2, 80
LDI r3, 42
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
