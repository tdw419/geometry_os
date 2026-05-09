; DESCRIPTION: Renders a red box of size 91x116 starting at (209, 45).
; PLAN: r0=209(x), r1=45(y), r2=91(width), r3=116(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 209
LDI r1, 45
LDI r2, 91
LDI r3, 116
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
