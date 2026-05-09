; DESCRIPTION: Renders a red box of size 83x92 starting at (387, 28).
; PLAN: r0=387(x), r1=28(y), r2=83(width), r3=92(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 387
LDI r1, 28
LDI r2, 83
LDI r3, 92
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
