; DESCRIPTION: Renders a yellow box of size 85x109 starting at (171, 59).
; PLAN: r0=171(x), r1=59(y), r2=85(width), r3=109(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 171
LDI r1, 59
LDI r2, 85
LDI r3, 109
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
