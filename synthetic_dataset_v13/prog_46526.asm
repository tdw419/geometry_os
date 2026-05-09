; DESCRIPTION: Renders a white box of size 46x68 starting at (408, 74).
; PLAN: r0=408(x), r1=74(y), r2=46(width), r3=68(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 74
LDI r2, 46
LDI r3, 68
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
