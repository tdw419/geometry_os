; DESCRIPTION: Renders a white box of size 106x103 starting at (92, 73).
; PLAN: r0=92(x), r1=73(y), r2=106(width), r3=103(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 92
LDI r1, 73
LDI r2, 106
LDI r3, 103
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
