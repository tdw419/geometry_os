; DESCRIPTION: Renders a white box of size 34x34 starting at (319, 213).
; PLAN: r0=319(x), r1=213(y), r2=34(width), r3=34(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 319
LDI r1, 213
LDI r2, 34
LDI r3, 34
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
