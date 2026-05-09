; DESCRIPTION: Renders a white box of size 82x24 starting at (279, 142).
; PLAN: r0=279(x), r1=142(y), r2=82(width), r3=24(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 279
LDI r1, 142
LDI r2, 82
LDI r3, 24
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
