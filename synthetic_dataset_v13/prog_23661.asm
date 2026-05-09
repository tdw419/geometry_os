; DESCRIPTION: Renders a green box of size 95x103 starting at (261, 85).
; PLAN: r0=261(x), r1=85(y), r2=95(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 261
LDI r1, 85
LDI r2, 95
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
