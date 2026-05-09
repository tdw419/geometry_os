; DESCRIPTION: Renders a black box of size 55x104 starting at (410, 2).
; PLAN: r0=410(x), r1=2(y), r2=55(width), r3=104(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 410
LDI r1, 2
LDI r2, 55
LDI r3, 104
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
