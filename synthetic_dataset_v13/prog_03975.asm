; DESCRIPTION: Renders a black box of size 50x34 starting at (433, 7).
; PLAN: r0=433(x), r1=7(y), r2=50(width), r3=34(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 433
LDI r1, 7
LDI r2, 50
LDI r3, 34
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
