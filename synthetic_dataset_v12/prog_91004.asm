; DESCRIPTION: Renders a white box of size 113x20 starting at (367, 32).
; PLAN: r0=367(x), r1=32(y), r2=113(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 367
LDI r1, 32
LDI r2, 113
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
