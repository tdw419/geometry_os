; DESCRIPTION: Renders a red box of size 92x44 starting at (46, 131).
; PLAN: r0=46(x), r1=131(y), r2=92(width), r3=44(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 46
LDI r1, 131
LDI r2, 92
LDI r3, 44
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
