; DESCRIPTION: Renders a red box of size 39x47 starting at (60, 171).
; PLAN: r0=60(x), r1=171(y), r2=39(width), r3=47(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 60
LDI r1, 171
LDI r2, 39
LDI r3, 47
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
