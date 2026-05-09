; DESCRIPTION: Renders a green box of size 27x103 starting at (104, 77).
; PLAN: r0=104(x), r1=77(y), r2=27(width), r3=103(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 104
LDI r1, 77
LDI r2, 27
LDI r3, 103
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
