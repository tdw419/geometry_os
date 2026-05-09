; DESCRIPTION: Renders a green box of size 79x68 starting at (285, 182).
; PLAN: r0=285(x), r1=182(y), r2=79(width), r3=68(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 285
LDI r1, 182
LDI r2, 79
LDI r3, 68
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
