; DESCRIPTION: Renders a red box of size 53x80 starting at (437, 164).
; PLAN: r0=437(x), r1=164(y), r2=53(width), r3=80(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 164
LDI r2, 53
LDI r3, 80
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
