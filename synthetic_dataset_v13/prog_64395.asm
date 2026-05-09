; DESCRIPTION: Renders a white box of size 34x109 starting at (27, 92).
; PLAN: r0=27(x), r1=92(y), r2=34(width), r3=109(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 27
LDI r1, 92
LDI r2, 34
LDI r3, 109
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
