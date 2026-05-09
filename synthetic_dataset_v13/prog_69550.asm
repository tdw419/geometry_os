; DESCRIPTION: Composite: Draws a magenta circle centered at (416, 209) with radius 29 then Places a blue dot at position (446, 223).
; PLAN: r0=416(x), r1=209(y), r2=29(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=446(x), r6=223(y), r7=0x0000FF(color). Op: PSET r5, r6, r7.
LDI r0, 416
LDI r1, 209
LDI r2, 29
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 446
LDI r6, 223
LDI r7, 0x0000FF
PSET r5, r6, r7
HALT
