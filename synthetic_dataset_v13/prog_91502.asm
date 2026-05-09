; DESCRIPTION: Composite: Renders a yellow box of size 47x55 starting at (271, 86) then Places a blue dot at position (366, 182).
; PLAN: r0=271(x), r1=86(y), r2=47(width), r3=55(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=366(x), r6=182(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 271
LDI r1, 86
LDI r2, 47
LDI r3, 55
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 366
LDI r6, 182
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
