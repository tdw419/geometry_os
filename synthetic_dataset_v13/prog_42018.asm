; DESCRIPTION: Renders a white box of size 66x106 starting at (445, 150).
; PLAN: r0=445(x), r1=150(y), r2=66(width), r3=106(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 445
LDI r1, 150
LDI r2, 66
LDI r3, 106
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
