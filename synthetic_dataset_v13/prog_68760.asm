; DESCRIPTION: Renders a white box of size 67x19 starting at (370, 33).
; PLAN: r0=370(x), r1=33(y), r2=67(width), r3=19(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 370
LDI r1, 33
LDI r2, 67
LDI r3, 19
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
