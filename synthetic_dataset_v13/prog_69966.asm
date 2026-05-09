; DESCRIPTION: Renders a white box of size 54x28 starting at (323, 213).
; PLAN: r0=323(x), r1=213(y), r2=54(width), r3=28(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 323
LDI r1, 213
LDI r2, 54
LDI r3, 28
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
