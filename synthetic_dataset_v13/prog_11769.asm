; DESCRIPTION: Renders a white box of size 28x82 starting at (420, 125).
; PLAN: r0=420(x), r1=125(y), r2=28(width), r3=82(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 420
LDI r1, 125
LDI r2, 28
LDI r3, 82
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
