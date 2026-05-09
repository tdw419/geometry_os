; DESCRIPTION: Renders a yellow box of size 104x27 starting at (151, 14).
; PLAN: r0=151(x), r1=14(y), r2=104(width), r3=27(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 151
LDI r1, 14
LDI r2, 104
LDI r3, 27
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
HALT
