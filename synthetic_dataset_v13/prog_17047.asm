; DESCRIPTION: Renders a white box of size 82x77 starting at (0, 0).
; PLAN: r0=0(x), r1=0(y), r2=82(width), r3=77(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 0
LDI r1, 0
LDI r2, 82
LDI r3, 77
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
