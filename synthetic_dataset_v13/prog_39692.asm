; DESCRIPTION: Renders a white box of size 47x30 starting at (421, 213).
; PLAN: r0=421(x), r1=213(y), r2=47(width), r3=30(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 421
LDI r1, 213
LDI r2, 47
LDI r3, 30
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
