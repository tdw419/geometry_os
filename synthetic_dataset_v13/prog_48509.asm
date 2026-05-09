; DESCRIPTION: Renders a red box of size 56x53 starting at (290, 134).
; PLAN: r0=290(x), r1=134(y), r2=56(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 290
LDI r1, 134
LDI r2, 56
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
