; DESCRIPTION: Renders a red box of size 99x81 starting at (408, 146).
; PLAN: r0=408(x), r1=146(y), r2=99(width), r3=81(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 408
LDI r1, 146
LDI r2, 99
LDI r3, 81
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
