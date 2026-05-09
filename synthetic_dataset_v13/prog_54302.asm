; DESCRIPTION: Renders a red box of size 25x25 starting at (146, 124).
; PLAN: r0=146(x), r1=124(y), r2=25(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 146
LDI r1, 124
LDI r2, 25
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
