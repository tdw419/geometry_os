; DESCRIPTION: Renders a blue box of size 56x83 starting at (187, 143).
; PLAN: r0=187(x), r1=143(y), r2=56(width), r3=83(height), r4=0x0000FF(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 187
LDI r1, 143
LDI r2, 56
LDI r3, 83
LDI r4, 0x0000FF
RECTF r0, r1, r2, r3, r4
HALT
