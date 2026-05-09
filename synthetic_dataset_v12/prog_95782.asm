; DESCRIPTION: Renders a white box of size 84x59 starting at (92, 168).
; PLAN: r0=92(x), r1=168(y), r2=84(width), r3=59(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 168
LDI r2, 84
LDI r3, 59
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
