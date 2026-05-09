; DESCRIPTION: Renders a yellow box of size 36x47 starting at (204, 152).
; PLAN: r0=204(x), r1=152(y), r2=36(width), r3=47(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 204
LDI r1, 152
LDI r2, 36
LDI r3, 47
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
