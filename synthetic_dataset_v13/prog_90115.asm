; DESCRIPTION: Renders a black box of size 33x90 starting at (464, 10).
; PLAN: r0=464(x), r1=10(y), r2=33(width), r3=90(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 10
LDI r2, 33
LDI r3, 90
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
