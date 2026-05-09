; DESCRIPTION: Renders a red box of size 55x15 starting at (433, 124).
; PLAN: r0=433(x), r1=124(y), r2=55(width), r3=15(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 124
LDI r2, 55
LDI r3, 15
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
