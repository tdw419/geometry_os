; DESCRIPTION: Renders a red box of size 80x32 starting at (235, 35).
; PLAN: r0=235(x), r1=35(y), r2=80(width), r3=32(height), r4=0xFF0000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 235
LDI r1, 35
LDI r2, 80
LDI r3, 32
LDI r4, 0xFF0000
RECTF r0, r1, r2, r3, r4
HALT
