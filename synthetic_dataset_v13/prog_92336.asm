; DESCRIPTION: Renders a white box of size 68x20 starting at (405, 5).
; PLAN: r0=405(x), r1=5(y), r2=68(width), r3=20(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 5
LDI r2, 68
LDI r3, 20
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
