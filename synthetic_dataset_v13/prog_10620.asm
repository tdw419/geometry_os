; DESCRIPTION: Renders a red box of size 91x72 starting at (333, 171).
; PLAN: r0=333(x), r1=171(y), r2=91(width), r3=72(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 333
LDI r1, 171
LDI r2, 91
LDI r3, 72
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
