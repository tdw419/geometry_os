; DESCRIPTION: Renders a red box of size 100x79 starting at (294, 164).
; PLAN: r0=294(x), r1=164(y), r2=100(width), r3=79(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 294
LDI r1, 164
LDI r2, 100
LDI r3, 79
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
