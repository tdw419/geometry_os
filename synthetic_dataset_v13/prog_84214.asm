; DESCRIPTION: Renders a red box of size 51x27 starting at (176, 146).
; PLAN: r0=176(x), r1=146(y), r2=51(width), r3=27(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 176
LDI r1, 146
LDI r2, 51
LDI r3, 27
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
