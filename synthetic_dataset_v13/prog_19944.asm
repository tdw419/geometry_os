; DESCRIPTION: Renders a green box of size 106x109 starting at (362, 53).
; PLAN: r0=362(x), r1=53(y), r2=106(width), r3=109(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 53
LDI r2, 106
LDI r3, 109
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
