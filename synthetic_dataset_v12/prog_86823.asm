; DESCRIPTION: Renders a white box of size 56x86 starting at (112, 37).
; PLAN: r0=112(x), r1=37(y), r2=56(width), r3=86(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 112
LDI r1, 37
LDI r2, 56
LDI r3, 86
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
