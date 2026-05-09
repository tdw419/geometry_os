; DESCRIPTION: Composite: Renders a yellow disk with center (25, 242) and radius 10 then Places a cyan dot at position (103, 224).
; PLAN: r0=25(x), r1=242(y), r2=10(radius), r3=0xFFFF00(color). Op: CIRCLE r0, r1, r2, r3 Next: r5=103(x), r6=224(y), r7=0x00FFFF(color). Op: PSET r5, r6, r7.
LDI r0, 25
LDI r1, 242
LDI r2, 10
LDI r3, 0xFFFF00
CIRCLE r0, r1, r2, r3
LDI r5, 103
LDI r6, 224
LDI r7, 0x00FFFF
PSET r5, r6, r7
HALT
