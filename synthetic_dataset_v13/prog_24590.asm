; DESCRIPTION: Renders a orange box of size 21x66 starting at (177, 71).
; PLAN: r0=177(x), r1=71(y), r2=21(width), r3=66(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 71
LDI r2, 21
LDI r3, 66
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
