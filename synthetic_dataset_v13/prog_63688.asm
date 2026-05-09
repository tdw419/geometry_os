; DESCRIPTION: Composite: Draws a yellow rectangle at (313, 181) with width 64 and height 38 then Places a black dot at position (398, 225).
; PLAN: r0=313(x), r1=181(y), r2=64(width), r3=38(height), r4=0xFFFF00(color). Op: RECTF r0, r1, r2, r3, r4 Next: r5=398(x), r6=225(y), r7=0x000000(color). Op: PSET r5, r6, r7.
LDI r0, 313
LDI r1, 181
LDI r2, 64
LDI r3, 38
LDI r4, 0xFFFF00
RECTF r0, r1, r2, r3, r4
LDI r5, 398
LDI r6, 225
LDI r7, 0x000000
PSET r5, r6, r7
HALT
