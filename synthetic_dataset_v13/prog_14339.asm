; DESCRIPTION: Renders a white box of size 46x10 starting at (331, 208).
; PLAN: r0=331(x), r1=208(y), r2=46(width), r3=10(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 331
LDI r1, 208
LDI r2, 46
LDI r3, 10
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
