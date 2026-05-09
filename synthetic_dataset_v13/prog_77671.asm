; DESCRIPTION: Renders a white box of size 92x82 starting at (342, 1).
; PLAN: r0=342(x), r1=1(y), r2=92(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 342
LDI r1, 1
LDI r2, 92
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
