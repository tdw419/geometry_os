; DESCRIPTION: Renders a green box of size 113x97 starting at (143, 77).
; PLAN: r0=143(x), r1=77(y), r2=113(width), r3=97(height), r4=0x00FF00(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 143
LDI r1, 77
LDI r2, 113
LDI r3, 97
LDI r4, 0x00FF00
RECTF r0, r1, r2, r3, r4
HALT
