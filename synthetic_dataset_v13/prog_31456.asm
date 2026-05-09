; DESCRIPTION: Renders a white box of size 109x99 starting at (362, 150).
; PLAN: r0=362(x), r1=150(y), r2=109(width), r3=99(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 362
LDI r1, 150
LDI r2, 109
LDI r3, 99
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
