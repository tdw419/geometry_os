; DESCRIPTION: Renders a yellow box of size 72x94 starting at (79, 152).
; PLAN: r0=79(x), r1=152(y), r2=72(width), r3=94(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 79
LDI r1, 152
LDI r2, 72
LDI r3, 94
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
