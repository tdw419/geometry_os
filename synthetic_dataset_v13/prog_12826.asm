; DESCRIPTION: Renders a red box of size 71x56 starting at (260, 146).
; PLAN: r0=260(x), r1=146(y), r2=71(width), r3=56(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 260
LDI r1, 146
LDI r2, 71
LDI r3, 56
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
