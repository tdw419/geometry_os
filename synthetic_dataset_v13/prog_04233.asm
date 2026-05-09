; DESCRIPTION: Renders a white box of size 48x107 starting at (330, 142).
; PLAN: r0=330(x), r1=142(y), r2=48(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 142
LDI r2, 48
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
