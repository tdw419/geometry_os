; DESCRIPTION: Renders a red box of size 114x25 starting at (180, 107).
; PLAN: r0=180(x), r1=107(y), r2=114(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 107
LDI r2, 114
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
