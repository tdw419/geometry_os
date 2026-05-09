; DESCRIPTION: Renders a red box of size 59x77 starting at (203, 82).
; PLAN: r0=203(x), r1=82(y), r2=59(width), r3=77(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 203
LDI r1, 82
LDI r2, 59
LDI r3, 77
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
