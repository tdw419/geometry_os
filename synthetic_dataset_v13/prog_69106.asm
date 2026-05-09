; DESCRIPTION: Renders a black box of size 47x117 starting at (298, 16).
; PLAN: r0=298(x), r1=16(y), r2=47(width), r3=117(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 16
LDI r2, 47
LDI r3, 117
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
