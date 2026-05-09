; DESCRIPTION: Places a red circle of radius 68 at center (242, 130).
; PLAN: r0=242(x), r1=130(y), r2=68(radius), r3=0xFF0000(color). Op: CIRCLE r0, r1, r2, r3.
LDI r0, 242
LDI r1, 130
LDI r2, 68
LDI r3, 0xFF0000
CIRCLE r0, r1, r2, r3
HALT
