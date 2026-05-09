; DESCRIPTION: Renders a red box of size 95x53 starting at (350, 152).
; PLAN: r0=350(x), r1=152(y), r2=95(width), r3=53(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 350
LDI r1, 152
LDI r2, 95
LDI r3, 53
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
