; DESCRIPTION: Renders a red box of size 120x105 starting at (180, 83).
; PLAN: r0=180(x), r1=83(y), r2=120(width), r3=105(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 180
LDI r1, 83
LDI r2, 120
LDI r3, 105
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
