; DESCRIPTION: Renders a orange box of size 44x98 starting at (177, 117).
; PLAN: r0=177(x), r1=117(y), r2=44(width), r3=98(height), r4=0xFF8800(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 177
LDI r1, 117
LDI r2, 44
LDI r3, 98
LDI r4, 0xFF8800
RECTF r0, r1, r2, r3, r4
HALT
