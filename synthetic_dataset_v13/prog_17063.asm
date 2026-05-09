; DESCRIPTION: Renders a black box of size 11x44 starting at (464, 55).
; PLAN: r0=464(x), r1=55(y), r2=11(width), r3=44(height), r4=0x000000(color). Op: RECTF r0, r1, r2, r3, r4.
LDI r0, 464
LDI r1, 55
LDI r2, 11
LDI r3, 44
LDI r4, 0x000000
RECTF r0, r1, r2, r3, r4
HALT
