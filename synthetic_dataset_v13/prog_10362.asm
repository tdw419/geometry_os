; DESCRIPTION: Renders a black box of size 90x73 starting at (295, 148).
; PLAN: r0=295(x), r1=148(y), r2=90(width), r3=73(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 295
LDI r1, 148
LDI r2, 90
LDI r3, 73
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
