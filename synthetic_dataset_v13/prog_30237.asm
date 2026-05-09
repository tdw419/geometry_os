; DESCRIPTION: Renders a yellow box of size 67x80 starting at (237, 124).
; PLAN: r0=237(x), r1=124(y), r2=67(width), r3=80(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 237
LDI r1, 124
LDI r2, 67
LDI r3, 80
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
