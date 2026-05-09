; DESCRIPTION: Renders a white box of size 84x56 starting at (168, 169).
; PLAN: r0=168(x), r1=169(y), r2=84(width), r3=56(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 169
LDI r2, 84
LDI r3, 56
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
