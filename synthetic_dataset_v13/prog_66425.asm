; DESCRIPTION: Renders a black box of size 27x83 starting at (198, 20).
; PLAN: r0=198(x), r1=20(y), r2=27(width), r3=83(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 198
LDI r1, 20
LDI r2, 27
LDI r3, 83
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
