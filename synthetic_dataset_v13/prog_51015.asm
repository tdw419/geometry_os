; DESCRIPTION: Renders a white box of size 63x107 starting at (374, 91).
; PLAN: r0=374(x), r1=91(y), r2=63(width), r3=107(height), r4=0xFFFFFF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 374
LDI r1, 91
LDI r2, 63
LDI r3, 107
LDI r4, 0xFFFFFF
RECTF r0, r1, r2, r3, r4
HALT
