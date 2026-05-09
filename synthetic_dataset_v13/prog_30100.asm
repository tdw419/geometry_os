; DESCRIPTION: Renders a white box of size 116x86 starting at (87, 125).
; PLAN: r0=87(x), r1=125(y), r2=116(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 87
LDI r1, 125
LDI r2, 116
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
