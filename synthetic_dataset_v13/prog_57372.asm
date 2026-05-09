; DESCRIPTION: Renders a white box of size 106x42 starting at (356, 60).
; PLAN: r0=356(x), r1=60(y), r2=106(width), r3=42(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 356
LDI r1, 60
LDI r2, 106
LDI r3, 42
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
