; DESCRIPTION: Renders a black box of size 103x83 starting at (298, 20).
; PLAN: r0=298(x), r1=20(y), r2=103(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 298
LDI r1, 20
LDI r2, 103
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
