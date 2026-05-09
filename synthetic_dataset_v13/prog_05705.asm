; DESCRIPTION: Renders a black box of size 18x54 starting at (168, 174).
; PLAN: r0=168(x), r1=174(y), r2=18(width), r3=54(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 168
LDI r1, 174
LDI r2, 18
LDI r3, 54
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
