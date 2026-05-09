; DESCRIPTION: Renders a red box of size 47x48 starting at (437, 83).
; PLAN: r0=437(x), r1=83(y), r2=47(width), r3=48(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 437
LDI r1, 83
LDI r2, 47
LDI r3, 48
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
