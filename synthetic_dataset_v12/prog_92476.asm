; DESCRIPTION: Renders a red box of size 59x79 starting at (330, 29).
; PLAN: r0=330(x), r1=29(y), r2=59(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 330
LDI r1, 29
LDI r2, 59
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
