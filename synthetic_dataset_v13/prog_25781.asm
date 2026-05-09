; DESCRIPTION: Renders a blue box of size 79x109 starting at (171, 137).
; PLAN: r0=171(x), r1=137(y), r2=79(width), r3=109(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 137
LDI r2, 79
LDI r3, 109
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
