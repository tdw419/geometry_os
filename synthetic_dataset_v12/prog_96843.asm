; DESCRIPTION: Renders a red box of size 50x32 starting at (105, 202).
; PLAN: r0=105(x), r1=202(y), r2=50(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 105
LDI r1, 202
LDI r2, 50
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
