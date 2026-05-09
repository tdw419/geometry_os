; DESCRIPTION: Renders a red box of size 109x25 starting at (103, 197).
; PLAN: r0=103(x), r1=197(y), r2=109(width), r3=25(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 103
LDI r1, 197
LDI r2, 109
LDI r3, 25
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
