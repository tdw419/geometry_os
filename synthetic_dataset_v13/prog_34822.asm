; DESCRIPTION: Renders a white box of size 92x34 starting at (387, 45).
; PLAN: r0=387(x), r1=45(y), r2=92(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 45
LDI r2, 92
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
