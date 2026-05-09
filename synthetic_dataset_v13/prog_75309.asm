; DESCRIPTION: Renders a red box of size 106x61 starting at (405, 134).
; PLAN: r0=405(x), r1=134(y), r2=106(width), r3=61(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 405
LDI r1, 134
LDI r2, 106
LDI r3, 61
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
