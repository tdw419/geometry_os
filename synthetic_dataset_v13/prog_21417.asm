; DESCRIPTION: Composite: Places a magenta circle of radius 11 at center (482, 146) then Places a green dot at position (265, 91).
; PLAN: r0=482(x), r1=146(y), r2=11(radius), r3=0xFF00FF(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=265(x), r6=91(y), r7=0x00FF00(color). Op: PSET r5, r6, r7.
LDI r0, 482
LDI r1, 146
LDI r2, 11
LDI r3, 0xFF00FF
CIRCLE r0, r1, r2, r3
LDI r5, 265
LDI r6, 91
LDI r7, 0x00FF00
PSET r5, r6, r7
HALT
