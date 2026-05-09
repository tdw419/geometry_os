; DESCRIPTION: Renders a green box of size 109x104 starting at (275, 79).
; PLAN: r0=275(x), r1=79(y), r2=109(width), r3=104(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 275
LDI r1, 79
LDI r2, 109
LDI r3, 104
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
